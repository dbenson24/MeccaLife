/*
* MeccaRadio ArmA3 client-side plugin
*
* Copyright (c) 2015 Daniel Corbe
* All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a
* copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* 1. Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the distribution.
* 3. Neither the name of the authors, copyright holders or the contributors
*    may be used to endorese or promote products derived from this software
*    without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS, AUTHORS AND
* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
* BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
* FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
* THE COPYRIGHT HOLDERS, AUTHORS OR CONTRIBUTORS BE HELD LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
* GOODS OR SERVICES; LOSS OF USE, DATA, COPYRIGHT ENFRINGEMENT, LOSS
* OF PROFITS, REVENUE, OR BUSINESS INTERRUPTION) HOWEVER CAUSED
* AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
* OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
* SUCH DAMAGE.
*
*/
#include "stdafx.h"
#pragma comment(lib, "strmiids.lib") 

/* Our music player */
HANDLE player = NULL;
IGraphBuilder *pGraph = NULL;
IMediaControl *pControl = NULL;
IMediaEvent   *pEvent = NULL;

DWORD WINAPI PlayerThread(LPVOID lpParameter)
{
	HRESULT hr;

	// Initialize the COM library.
	hr = CoInitialize(NULL);
	if (FAILED(hr))
	{
		return FALSE;
	}

	// Create the filter graph manager and query for interfaces.
	hr = CoCreateInstance(CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER,
		IID_IGraphBuilder, (void **)&pGraph);
	if (FAILED(hr))
	{
		return FALSE;
	}

	hr = pGraph->QueryInterface(IID_IMediaControl, (void **)&pControl);
	hr = pGraph->QueryInterface(IID_IMediaEvent, (void **)&pEvent);

	// Build the graph.
	hr = pGraph->RenderFile((LPCWSTR)lpParameter, NULL);
	if (SUCCEEDED(hr))
	{
		// Run the graph.
		hr = pControl->Run();
		if (SUCCEEDED(hr))
		{
			// Wait for completion.
			long evCode;
			pEvent->WaitForCompletion(INFINITE, &evCode);
		}
	}

	// Clean up in reverse order.
	pEvent->Release();
	pControl->Release();
	pGraph->Release();
	CoUninitialize();

	ExitThread(1);
	return 1;
}


BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

extern "C"
{
	__declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
	char *streamurl = NULL; 
	char streamname[512];
	struct url_data url;
	wchar_t *wcstring;

	/* We do this so we can null-term the string later. */
	outputSize -= 1;

	if (strncmp(function, "version", strlen(function)) == 0)
	{
		strncpy(output, "meccaradio:1", outputSize);
	}
	else if (strncmp(function, "play:", 5) == 0)
	{
		streamurl = (char *)&function[5];

		parse_url(&url, streamurl);
		stationinfo(url.hostname, url.cport, url.path, streamname);

		// dshow expects wide strings, not C strings.  So we must convert the URL
		wcstring = (wchar_t *)LocalAlloc(LMEM_ZEROINIT, sizeof(wchar_t) * strlen(streamurl));
		MultiByteToWideChar(CP_ACP, 0, streamurl, strlen(streamurl), wcstring, URL_MAX);

		player = CreateThread(NULL, 0, PlayerThread, wcstring, 0, NULL);

		LocalFree(wcstring);

		strncpy(output, streamname, outputSize);
	}
	else if (strncmp(function, "stop:", 5) == 0)
	{
		pControl->Stop();
		strncpy(output, "RADIO OFF", outputSize);
	}
}
