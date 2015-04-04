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
#include "parseurl.h"

int parse_url(url_data_t* data, char* url)
{
	char *ptr;
	size_t i; size_t l;
	enum { P_PROTO, P_HOST, P_PORT } state = P_PROTO;

	/* Make sure we have a clean struct to work with */
	memset(data, 0, sizeof(url_data_t));

	/* Store the original URL */
	strncpy(data->url, url, URL_MAX);

	/* Yay state */
	ptr = &url[0];
	l = 0;
	for (i = 0; i < strlen(url); i++)
	{
		switch (state)
		{
		case P_PROTO:
			if (url[i] == ':')
			{
				if (url[i + 1] == '/' && url[i + 2] == '/')
				{
					strncpy(data->protocol, ptr, l);
					state = P_HOST;
					i = i + 3;
					l = 0;
					ptr = &url[i];
				}
				else
					return URLPARSE_MALFORMED;
				continue;
			}
			l++;
			continue;
		case P_HOST:
			if (url[i] == ':')
			{
				strncpy(data->hostname, ptr, l + 1);
				state = P_PORT;
				i++;
				l = 0;
				ptr = &url[i];
			}
			else if (url[i] == '/')
			{
				strncpy(data->hostname, ptr, l + 1);
				goto done;
			}
			l++;
			continue;
		case P_PORT:
			if (url[i] == '/')
			{
				strncpy(data->cport, ptr, l);
				l = 0;
				goto done;
			}
			l++;
			continue;
		default:
			return 0;
		}
	}

done:
	// Save the path
	strncpy(data->path, &url[i], strlen(&url[i]));

	// If we finished the loop without a host
	// then the url didn't contain a trailing '/'
	if (strisnull(data->hostname))
	{
		strncpy(data->hostname, ptr, l + 1);
	}

	// Port info
	if (strisnull(data->cport))
	{
		strncpy(data->cport, "80", 2);
	}
	data->port = atoi(data->cport);

	// Path Info
	if (strisnull(data->path))
	{
		strncpy(data->path, DEFAULT_PATH, strlen(DEFAULT_PATH));
	}

	return 1;
}

