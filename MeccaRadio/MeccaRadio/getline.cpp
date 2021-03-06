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

int strisnull(const char *s)
{
	if (s[0] == '\0' || s[0] == '\r' || s[0] == '\n')
		return 1;
	return 0;
}

size_t getline(char *s, char *d)
{
	char *c;
	size_t l = 0;

	for (c = &s[l]; *c; c++)
	{
		d[l] = *c;
		l++;
		if (*c == '\r' || *c == '\n')
			goto success;
	}

	// If we get here, it means we did not detect a newline character.
	// We probably need to wait for more data (SOCKET i/o, FILE, i/o)
	return 0;

success:
	// Account for \r\n or \n\r in a single line
	if (s[l] == '\r' || s[l] == '\n')
	{
		d[l] = s[l];
		l++;
	}

	// Make sure the new string is null-terminated.
	d[l] = '\0';
	return l;
}

