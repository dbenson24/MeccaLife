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
#ifndef PARSEURL_H
#define PARSEURL_H

#define ERRVAL -1
#define DEFAULT_PORT 80
#define DEFAULT_PATH "/"

// http://support.microsoft.com/en-us/kb/208427
#define URL_MAX 2083
#define PROTO_MAX 25
#define HOSTNAME_MAX 256
#define PATH_MAX 256
#define PORT_MAX 6

#define URLPARSE_MALFORMED -1
#define URLPARSE_EUNKNOWN 0
#define URLPARSE_SUCCESS 1

typedef struct url_data {
	char url[URL_MAX];
	char protocol[PROTO_MAX];
	char hostname[HOSTNAME_MAX];
	char path[PATH_MAX];
	char cport[PORT_MAX];
	int port;
} url_data_t;

int parse_url(url_data_t* data, char* url);
void free_url_data(url_data_t* data);

#endif /* PARSEURL_H */