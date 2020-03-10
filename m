Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2B317FC38
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 14:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbgCJNTf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 09:19:35 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:15666 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730189AbgCJNTf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 09:19:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02ADF6lV027250;
        Tue, 10 Mar 2020 14:19:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6FTIlpm5ui91pTev/0YQjumwgOU+bnAREzXW2dvvz7o=;
 b=OctjGosg4hQ23eOblRYmyBkxByeoK2LrQrdn85uHdUBftAAkMLvZlBJBRufNXFnjVRY1
 CqvJzg2Ag2Mo2GbKQtExFivQN0T6nyKl6Bs/6Fq6snad73h6MFWQI2R8UGazmzej+1Ra
 VbEl4AZdpWCYNbDMEt7fqwosLx7sKr2Urfnygba7jI2fIz62k/s4HfRoPyDJ74Jqbk2G
 t/KE0MtAbUldB/4mI/2dwJowkj1y+XMPFbcJFFN55m8eFx7bnFabfUNVDNH+hyoYY8Wb
 ZgR6X3IrnVd5F2turnthv9XVJsUfCFl2FYTdvrC6B//T1bQDm9emUpkDCQEztn39iYIu cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ym1y6knrx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Mar 2020 14:19:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FA8710002A;
        Tue, 10 Mar 2020 14:19:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D1042B2B49;
        Tue, 10 Mar 2020 14:19:27 +0100 (CET)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar
 2020 14:19:27 +0100
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Tue, 10 Mar 2020 14:19:26 +0100
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To:     Nikita Shubin <nshubin@topcon.com>
CC:     "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH v5] remoteproc: Fix NULL pointer dereference in
 rproc_virtio_notify
Thread-Topic: [PATCH v5] remoteproc: Fix NULL pointer dereference in
 rproc_virtio_notify
Thread-Index: AQHV84hCP3zGFKf6g06Ie4v5FzG4AqhAVT0AgAFcOwCAAB5WwA==
Date:   Tue, 10 Mar 2020 13:19:26 +0000
Message-ID: <507197c5412e4b438aeb5c527be74b3a@SFHDAG3NODE1.st.com>
References: <20200306070325.15232-1-NShubin@topcon.com>
 <20200306072452.24743-1-NShubin@topcon.com>
 <6c7ef4f2-6f71-c2fb-b2e9-ad7cbeb7cfbc@st.com>
 <20200310120846.GA19430@topcon.com>
In-Reply-To: <20200310120846.GA19430@topcon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-10_06:2020-03-10,2020-03-10 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGludXgtcmVtb3RlcHJv
Yy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbW90ZXByb2MtDQo+IG93bmVyQHZnZXIu
a2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIE5pa2l0YSBTaHViaW4NCj4gU2VudDogbWFyZGkgMTAg
bWFycyAyMDIwIDEzOjA5DQo+IFRvOiBBcm5hdWQgUE9VTElRVUVOIDxhcm5hdWQucG91bGlxdWVu
QHN0LmNvbT4NCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc7IE9oYWQgQmVuLUNvaGVuIDxv
aGFkQHdpemVyeS5jb20+OyBCam9ybg0KPiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5h
cm8ub3JnPjsgbGludXgtDQo+IHJlbW90ZXByb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBs
aW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1XSByZW1vdGVwcm9jOiBGaXggTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGluDQo+IHJwcm9jX3ZpcnRpb19ub3RpZnkNCj4gDQo+IE9u
IE1vbiwgTWFyIDA5LCAyMDIwIGF0IDAzOjIyOjI0UE0gKzAxMDAsIEFybmF1ZCBQT1VMSVFVRU4g
d3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBzb3JyeSBmb3IgdGhlIGxhdGUgYW5zd2VyLi4uDQo+
ID4NCj4gPiBPbiAzLzYvMjAgODoyNCBBTSwgTmlraXRhIFNodWJpbiB3cm90ZToNCj4gPiA+IFVu
ZGVmaW5lZCBycHJvY19vcHMgLmtpY2sgbWV0aG9kIGluIHJlbW90ZXByb2MgZHJpdmVyIHdpbGwg
cmVzdWx0IGluDQo+ID4gPiAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIiBpbg0KPiA+ID4gcnByb2NfdmlydGlvX25vdGlmeSwgYWZ0ZXIgZmlybXdhcmUg
bG9hZGluZyBpZjoNCj4gPiA+DQo+ID4gPiAgMSkgLmtpY2sgbWV0aG9kIHdhc24ndCBkZWZpbmVk
IGluIGRyaXZlcg0KPiA+ID4gIDIpIHJlc291cmNlX3RhYmxlIGV4aXN0cyBpbiBmaXJtd2FyZSBh
bmQgaGFzICJWaXJ0aW8gZGV2aWNlIGVudHJ5Ig0KPiA+ID4gZGVmaW5lZA0KPiA+ID4NCj4gPiA+
IExldCdzIHJlZnVzZSB0byByZWdpc3RlciBhbiBycHJvYy1pbmR1Y2VkIHZpcnRpbyBkZXZpY2Ug
aWYgbm8ga2ljaw0KPiA+ID4gbWV0aG9kIHdhcyBkZWZpbmVkIGZvciBycHJvYy4NCj4gPiA+DQo+
ID4gPiBbICAgMTMuMTgwMDQ5XVsgIFQ0MTVdIDg8LS0tIGN1dCBoZXJlIC0tLQ0KPiA+ID4gWyAg
IDEzLjE5MDU1OF1bICBUNDE1XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UNCj4gYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwDQo+ID4gPiBbICAgMTMu
MjEyNTQ0XVsgIFQ0MTVdIHBnZCA9IChwdHJ2YWwpDQo+ID4gPiBbICAgMTMuMjE3MDUyXVsgIFQ0
MTVdIFswMDAwMDAwMF0gKnBnZD0wMDAwMDAwMA0KPiA+ID4gWyAgIDEzLjIyNDY5Ml1bICBUNDE1
XSBJbnRlcm5hbCBlcnJvcjogT29wczogODAwMDAwMDUgWyMxXSBQUkVFTVBUIFNNUA0KPiBBUk0N
Cj4gPiA+IFsgICAxMy4yMzEzMThdWyAgVDQxNV0gTW9kdWxlcyBsaW5rZWQgaW46IHJwbXNnX2No
YXIgaW14X3Jwcm9jDQo+IHZpcnRpb19ycG1zZ19idXMgcnBtc2dfY29yZSBbbGFzdCB1bmxvYWRl
ZDogaW14X3Jwcm9jXQ0KPiA+ID4gWyAgIDEzLjI0MTY4N11bICBUNDE1XSBDUFU6IDAgUElEOiA0
MTUgQ29tbTogdW5sb2FkLWxvYWQuc2ggTm90IHRhaW50ZWQNCj4gNS41LjItMDAwMDItZzcwN2Rm
MTNiYmJkZCAjNg0KPiA+ID4gWyAgIDEzLjI1MDU2MV1bICBUNDE1XSBIYXJkd2FyZSBuYW1lOiBG
cmVlc2NhbGUgaS5NWDcgRHVhbCAoRGV2aWNlIFRyZWUpDQo+ID4gPiBbICAgMTMuMjU3MDA5XVsg
IFQ0MTVdIFBDIGlzIGF0IDB4MA0KPiA+ID4gWyAgIDEzLjI2MDI0OV1bICBUNDE1XSBMUiBpcyBh
dCBycHJvY192aXJ0aW9fbm90aWZ5KzB4MmMvMHg1NA0KPiA+ID4gWyAgIDEzLjI2NTczOF1bICBU
NDE1XSBwYyA6IFs8MDAwMDAwMDA+XSAgICBsciA6IFs8ODA1MGY2YjA+XSAgICBwc3I6IDYwMDEw
MTEzDQo+ID4gPiBbICAgMTMuMjcyNzAyXVsgIFQ0MTVdIHNwIDogYjhkNDdjNDggIGlwIDogMDAw
MDAwMDEgIGZwIDogYmMwNGRlMDANCj4gPiA+IFsgICAxMy4yNzg2MjVdWyAgVDQxNV0gcjEwOiBi
YzA0YzAwMCAgcjkgOiAwMDAwMGNjMCAgcjggOiBiOGQ0NjAwMA0KPiA+ID4gWyAgIDEzLjI4NDU0
OF1bICBUNDE1XSByNyA6IDAwMDAwMDAwICByNiA6IGI4OThmMjAwICByNSA6IDAwMDAwMDAwICBy
NCA6DQo+IGI4YTI5ODAwDQo+ID4gPiBbICAgMTMuMjkxNzczXVsgIFQ0MTVdIHIzIDogMDAwMDAw
MDAgIHIyIDogOTkwYTNhZDQgIHIxIDogMDAwMDAwMDAgIHIwIDoNCj4gYjhhMjk4MDANCj4gPiA+
IFsgICAxMy4yOTkwMDBdWyAgVDQxNV0gRmxhZ3M6IG5aQ3YgIElSUXMgb24gIEZJUXMgb24gIE1v
ZGUgU1ZDXzMyICBJU0ENCj4gQVJNICBTZWdtZW50IG5vbmUNCj4gPiA+IFsgICAxMy4zMDY4MzNd
WyAgVDQxNV0gQ29udHJvbDogMTBjNTM4N2QgIFRhYmxlOiBiOGI0ODA2YSAgREFDOiAwMDAwMDA1
MQ0KPiA+ID4gWyAgIDEzLjMxMzI3OF1bICBUNDE1XSBQcm9jZXNzIHVubG9hZC1sb2FkLnNoIChw
aWQ6IDQxNSwgc3RhY2sgbGltaXQgPQ0KPiAweChwdHJ2YWwpKQ0KPiA+ID4gWyAgIDEzLjMyMDU5
MV1bICBUNDE1XSBTdGFjazogKDB4YjhkNDdjNDggdG8gMHhiOGQ0ODAwMCkNCj4gPiA+IFsgICAx
My4zMjU2NTFdWyAgVDQxNV0gN2M0MDogICAgICAgICAgICAgICAgICAgYjg5NWI2ODAgMDAwMDAw
MDEgYjg5OGYyMDAgODAzYzY0MzANCj4gYjg5NWJjODAgN2YwMGFlMTgNCj4gPiA+IFsgICAxMy4z
MzQ1MzFdWyAgVDQxNV0gN2M2MDogMDAwMDAwMzUgMDAwMDAwMDAgMDAwMDAwMDAgYjkzOTMyMDAN
Cj4gODBiM2VkODAgMDAwMDQwMDAgYjkzOTMyNjggYmJmNWE5YTINCj4gPiA+IFsgICAxMy4zNDM0
MTBdWyAgVDQxNV0gN2M4MDogMDAwMDBlMDAgMDAwMDAyMDAgMDAwMDAwMDAgN2YwMGFmZjAgN2Yw
MGEwMTQNCj4gYjg5NWI2ODAgYjg5NWI4MDAgOTkwYTNhZDQNCj4gPiA+IFsgICAxMy4zNTIyOTBd
WyAgVDQxNV0gN2NhMDogMDAwMDAwMDEgYjg5OGYyMTAgYjg5OGYyMDAgMDAwMDAwMDANCj4gMDAw
MDAwMDAgN2YwMGUwMDAgMDAwMDAwMDEgMDAwMDAwMDANCj4gPiA+IFsgICAxMy4zNjExNzBdWyAg
VDQxNV0gN2NjMDogMDAwMDAwMDAgODAzYzYyZTAgODBiMjE2OWMgODAyYTA5MjQNCj4gYjg5OGYy
MTAgMDAwMDAwMDAgMDAwMDAwMDAgYjg5OGYyMTANCj4gPiA+IFsgICAxMy4zNzAwNDldWyAgVDQx
NV0gN2NlMDogODBiOWJhNDQgMDAwMDAwMDAgODBiOWJhNDggMDAwMDAwMDANCj4gN2YwMGUwMDAg
MDAwMDAwMDggODBiMjE2OWMgODA0MDAxMTQNCj4gPiA+IFsgICAxMy4zNzg5MjldWyAgVDQxNV0g
N2QwMDogODBiMjE2OWMgODA2MWZkNjQgYjg5OGYyMTAgN2YwMGUwMDANCj4gODA0MDA3NDQgYjhk
NDYwMDAgODBiMjE2MzQgODBiMjE2MzQNCj4gPiA+IFsgICAxMy4zODc4MDldWyAgVDQxNV0gN2Qy
MDogODBiMjE2OWMgODA0MDA2MTQgODBiMjE2MzQgODA0MDA3MTgNCj4gN2YwMGUwMDAgMDAwMDAw
MDAgYjhkNDdkN2MgODA0MDA3NDQNCj4gPiA+IFsgICAxMy4zOTY2ODldWyAgVDQxNV0gN2Q0MDog
YjhkNDYwMDAgODBiMjE2MzQgODBiMjE2MzQgODAzZmUzMzgNCj4gYjg5OGYyNTQgYjgwZmU3NmMg
YjhkMzJlMzggOTkwYTNhZDQNCj4gPiA+IFsgICAxMy40MDU1NjldWyAgVDQxNV0gN2Q2MDogZmZm
ZmZmZjMgYjg5OGYyMTAgYjhkNDYwMDAgMDAwMDAwMDEgYjg5OGYyNTQNCj4gODAzZmZlN2MgODA4
NTdhOTAgYjg5OGYyMTANCj4gPiA+IFsgICAxMy40MTQ0NDldWyAgVDQxNV0gN2Q4MDogMDAwMDAw
MDEgOTkwYTNhZDQgYjhkNDYwMDAgYjg5OGYyMTANCj4gYjg5OGYyMTAgODBiMTdhZWMgYjhhMjlj
MjAgODAzZmYwYTQNCj4gPiA+IFsgICAxMy40MjMzMjhdWyAgVDQxNV0gN2RhMDogYjg5OGYyMTAg
MDAwMDAwMDAgYjhkNDYwMDAgODAzZmI4ZTANCj4gYjg5OGYyMDAgMDAwMDAwMDAgODBiMTdhZWMg
Yjg5OGYyMTANCj4gPiA+IFsgICAxMy40MzIyMDldWyAgVDQxNV0gN2RjMDogYjhhMjljMjAgOTkw
YTNhZDQgYjg5NWI5MDAgYjg5OGYyMDANCj4gODA1MGZiN2MgODBiMTdhZWMgYjg5OGYyMTAgYjhh
MjljMjANCj4gPiA+IFsgICAxMy40NDEwODhdWyAgVDQxNV0gN2RlMDogYjhhMjk4MDAgYjg5NWI5
MDAgYjhhMjlhMDQgODAzYzVlYzANCj4gYjhhMjljMDAgYjg5OGYyMDAgYjhhMjlhMjAgMDAwMDAw
MDcNCj4gPiA+IFsgICAxMy40NDk5NjhdWyAgVDQxNV0gN2UwMDogYjhhMjljMjAgODA1MGZkNzgg
YjhhMjk4MDAgMDAwMDAwMDANCj4gYjhhMjlhMjAgYjhhMjljMDQgYjhhMjk4MjAgYjhhMjk5ZDAN
Cj4gPiA+IFsgICAxMy40NTg4NDhdWyAgVDQxNV0gN2UyMDogYjg5NWI5MDAgODA1MGU1YTQgYjhh
Mjk4MDAgYjhhMjk5ZDgNCj4gYjhkNDYwMDAgYjhhMjk5ZTAgYjhhMjk4MjAgYjhhMjk5ZDANCj4g
PiA+IFsgICAxMy40Njc3MjhdWyAgVDQxNV0gN2U0MDogYjg5NWI5MDAgODA1MGUwMDggMDAwMDQx
ZWQgMDAwMDAwMDANCj4gYjhiOGM0NDAgYjhhMjk5ZDggYjhhMjk5ZTAgYjhhMjk5ZDgNCj4gPiA+
IFsgICAxMy40NzY2MDhdWyAgVDQxNV0gN2U2MDogYjhiOGM0NDAgOTkwYTNhZDQgMDAwMDAwMDAg
YjhhMjk4MjANCj4gYjhiOGM0MDAgMDAwMDAwMDYgYjhhMjk4MDAgYjg5NWI4ODANCj4gPiA+IFsg
ICAxMy40ODU0ODddWyAgVDQxNV0gN2U4MDogYjhkNDdmNzggMDAwMDAwMDAgMDAwMDAwMDAgODA1
MGY0YjQNCj4gMDAwMDAwMDYgYjg5NWI4OTAgYjhiOGM0MDAgMDA4ZmJlYTANCj4gPiA+IFsgICAx
My40OTQzNjddWyAgVDQxNV0gN2VhMDogYjg5NWI4ODAgODAyOWY1MzAgMDAwMDAwMDAgMDAwMDAw
MDANCj4gYjhkNDYwMDAgMDAwMDAwMDYgYjhkNDYwMDAgMDA4ZmJlYTANCj4gPiA+IFsgICAxMy41
MDMyNDZdWyAgVDQxNV0gN2VjMDogODAyOWY0MzQgMDAwMDAwMDAgYjhkNDYwMDAgMDAwMDAwMDAN
Cj4gMDAwMDAwMDAgODAyMWUyZTQgMDAwMDAwMGEgODA2MWZkMGMNCj4gPiA+IFsgICAxMy41MTIx
MjVdWyAgVDQxNV0gN2VlMDogMDAwMDAwMGEgYjhhZjBjMDAgMDAwMDAwMGEgYjhhZjBjNDANCj4g
MDAwMDAwMDEgYjhhZjBjNDAgMDAwMDAwMDAgODA2MWY5MTANCj4gPiA+IFsgICAxMy41MjEwMDVd
WyAgVDQxNV0gN2YwMDogMDAwMDAwMGEgODAyNDBhZjQgMDAwMDAwMDIgYjhkNDYwMDANCj4gMDAw
MDAwMDAgODA2MWZkMGMgMDAwMDAwMDIgODAyMzJkN2MNCj4gPiA+IFsgICAxMy41Mjk4ODRdWyAg
VDQxNV0gN2YyMDogMDAwMDAwMDAgYjhkNDYwMDAgMDAwMDAwMDAgOTkwYTNhZDQNCj4gMDAwMDAw
MDAgMDAwMDAwMDYgYjhhNjJkODAgMDA4ZmJlYTANCj4gPiA+IFsgICAxMy41Mzg3NjRdWyAgVDQx
NV0gN2Y0MDogYjhkNDdmNzggMDAwMDAwMDAgYjhkNDYwMDAgMDAwMDAwMDANCj4gMDAwMDAwMDAg
ODAyMjEwYzAgYjg4ZjI5MDAgMDAwMDAwMDANCj4gPiA+IFsgICAxMy41NDc2NDRdWyAgVDQxNV0g
N2Y2MDogYjhhNjJkODAgYjhhNjJkODAgYjhkNDYwMDAgMDAwMDAwMDYNCj4gMDA4ZmJlYTAgODAy
MjEzMjAgMDAwMDAwMDAgMDAwMDAwMDANCj4gPiA+IFsgICAxMy41NTY1MjRdWyAgVDQxNV0gN2Y4
MDogYjhhZjBjMDAgOTkwYTNhZDQgMDAwMDAwNmMgMDA4ZmJlYTAgNzZmMWNkYTANCj4gMDAwMDAw
MDQgODAxMDEyMDQgMDAwMDAwMDQNCj4gPiA+IFsgICAxMy41NjU0MDNdWyAgVDQxNV0gN2ZhMDog
MDAwMDAwMDAgODAxMDEwMDAgMDAwMDAwNmMgMDA4ZmJlYTANCj4gMDAwMDAwMDEgMDA4ZmJlYTAg
MDAwMDAwMDYgMDAwMDAwMDANCj4gPiA+IFsgICAxMy41NzQyODNdWyAgVDQxNV0gN2ZjMDogMDAw
MDAwNmMgMDA4ZmJlYTAgNzZmMWNkYTAgMDAwMDAwMDQgMDAwMDAwMDYNCj4gMDAwMDAwMDYgMDAw
MDAwMDAgMDAwMDAwMDANCj4gPiA+IFsgICAxMy41ODMxNjJdWyAgVDQxNV0gN2ZlMDogMDAwMDAw
MDQgN2ViYWY3ZDAgNzZlYjRjMGIgNzZlM2YyMDYNCj4gNjAwZDAwMzAgMDAwMDAwMDEgMDAwMDAw
MDAgMDAwMDAwMDANCj4gPiA+IFsgICAxMy41OTIwNTZdWyAgVDQxNV0gWzw4MDUwZjZiMD5dIChy
cHJvY192aXJ0aW9fbm90aWZ5KSBmcm9tDQo+IFs8ODAzYzY0MzA+XSAodmlydHF1ZXVlX25vdGlm
eSsweDFjLzB4MzQpDQo+ID4gPiBbICAgMTMuNjAxMjk4XVsgIFQ0MTVdIFs8ODAzYzY0MzA+XSAo
dmlydHF1ZXVlX25vdGlmeSkgZnJvbSBbPDdmMDBhZTE4Pl0NCj4gKHJwbXNnX3Byb2JlKzB4Mjgw
LzB4MzgwIFt2aXJ0aW9fcnBtc2dfYnVzXSkNCj4gPiA+IFsgICAxMy42MTE2NjNdWyAgVDQxNV0g
Wzw3ZjAwYWUxOD5dIChycG1zZ19wcm9iZSBbdmlydGlvX3JwbXNnX2J1c10pDQo+IGZyb20gWzw4
MDNjNjJlMD5dICh2aXJ0aW9fZGV2X3Byb2JlKzB4MWY4LzB4MmM0KQ0KPiA+ID4gWyAgIDEzLjYy
MjAyMl1bICBUNDE1XSBbPDgwM2M2MmUwPl0gKHZpcnRpb19kZXZfcHJvYmUpIGZyb20gWzw4MDQw
MDExND5dDQo+IChyZWFsbHlfcHJvYmUrMHgyMDAvMHg0NTApDQo+ID4gPiBbICAgMTMuNjMwODE3
XVsgIFQ0MTVdIFs8ODA0MDAxMTQ+XSAocmVhbGx5X3Byb2JlKSBmcm9tIFs8ODA0MDA2MTQ+XQ0K
PiAoZHJpdmVyX3Byb2JlX2RldmljZSsweDE2Yy8weDFhYykNCj4gPiA+IFsgICAxMy42Mzk4NzNd
WyAgVDQxNV0gWzw4MDQwMDYxND5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKSBmcm9tDQo+IFs8ODAz
ZmUzMzg+XSAoYnVzX2Zvcl9lYWNoX2RydisweDg0LzB4YzgpDQo+ID4gPiBbICAgMTMuNjQ5MTAy
XVsgIFQ0MTVdIFs8ODAzZmUzMzg+XSAoYnVzX2Zvcl9lYWNoX2RydikgZnJvbSBbPDgwM2ZmZTdj
Pl0NCj4gKF9fZGV2aWNlX2F0dGFjaCsweGQ0LzB4MTY0KQ0KPiA+ID4gWyAgIDEzLjY1ODA2OV1b
ICBUNDE1XSBbPDgwM2ZmZTdjPl0gKF9fZGV2aWNlX2F0dGFjaCkgZnJvbSBbPDgwM2ZmMGE0Pl0N
Cj4gKGJ1c19wcm9iZV9kZXZpY2UrMHg4NC8weDhjKQ0KPiA+ID4gWyAgIDEzLjY2Njk1MF1bICBU
NDE1XSBbPDgwM2ZmMGE0Pl0gKGJ1c19wcm9iZV9kZXZpY2UpIGZyb20NCj4gWzw4MDNmYjhlMD5d
IChkZXZpY2VfYWRkKzB4NDQ0LzB4NzY4KQ0KPiA+ID4gWyAgIDEzLjY3NTU3Ml1bICBUNDE1XSBb
PDgwM2ZiOGUwPl0gKGRldmljZV9hZGQpIGZyb20gWzw4MDNjNWVjMD5dDQo+IChyZWdpc3Rlcl92
aXJ0aW9fZGV2aWNlKzB4YTQvMHhmYykNCj4gPiA+IFsgICAxMy42ODQ1NDFdWyAgVDQxNV0gWzw4
MDNjNWVjMD5dIChyZWdpc3Rlcl92aXJ0aW9fZGV2aWNlKSBmcm9tDQo+IFs8ODA1MGZkNzg+XSAo
cnByb2NfYWRkX3ZpcnRpb19kZXYrMHhjYy8weDFiOCkNCj4gPiA+IFsgICAxMy42OTQ0NjZdWyAg
VDQxNV0gWzw4MDUwZmQ3OD5dIChycHJvY19hZGRfdmlydGlvX2RldikgZnJvbQ0KPiBbPDgwNTBl
NWE0Pl0gKHJwcm9jX3N0YXJ0KzB4MTQ4LzB4MjAwKQ0KPiA+ID4gWyAgIDEzLjcwMzUyMV1bICBU
NDE1XSBbPDgwNTBlNWE0Pl0gKHJwcm9jX3N0YXJ0KSBmcm9tIFs8ODA1MGUwMDg+XQ0KPiAocnBy
b2NfYm9vdCsweDM4NC8weDVjMCkNCj4gPiA+IFsgICAxMy43MTE3MDhdWyAgVDQxNV0gWzw4MDUw
ZTAwOD5dIChycHJvY19ib290KSBmcm9tIFs8ODA1MGY0YjQ+XQ0KPiAoc3RhdGVfc3RvcmUrMHgz
Yy8weGM4KQ0KPiA+ID4gWyAgIDEzLjcxOTcyM11bICBUNDE1XSBbPDgwNTBmNGI0Pl0gKHN0YXRl
X3N0b3JlKSBmcm9tIFs8ODAyOWY1MzA+XQ0KPiAoa2VybmZzX2ZvcF93cml0ZSsweGZjLzB4MjE0
KQ0KPiA+ID4gWyAgIDEzLjcyODM0OF1bICBUNDE1XSBbPDgwMjlmNTMwPl0gKGtlcm5mc19mb3Bf
d3JpdGUpIGZyb20gWzw4MDIxZTJlND5dDQo+IChfX3Zmc193cml0ZSsweDMwLzB4MWNjKQ0KPiA+
ID4gWyAgIDEzLjczNjk3MV1bICBUNDE1XSBbPDgwMjFlMmU0Pl0gKF9fdmZzX3dyaXRlKSBmcm9t
IFs8ODAyMjEwYzA+XQ0KPiAodmZzX3dyaXRlKzB4YWMvMHgxN2MpDQo+ID4gPiBbICAgMTMuNzQ0
OTg1XVsgIFQ0MTVdIFs8ODAyMjEwYzA+XSAodmZzX3dyaXRlKSBmcm9tIFs8ODAyMjEzMjA+XQ0K
PiAoa3N5c193cml0ZSsweDY0LzB4ZTQpDQo+ID4gPiBbICAgMTMuNzUyODI1XVsgIFQ0MTVdIFs8
ODAyMjEzMjA+XSAoa3N5c193cml0ZSkgZnJvbSBbPDgwMTAxMDAwPl0NCj4gKHJldF9mYXN0X3N5
c2NhbGwrMHgwLzB4NTQpDQo+ID4gPiBbICAgMTMuNzYxMTc4XVsgIFQ0MTVdIEV4Y2VwdGlvbiBz
dGFjaygweGI4ZDQ3ZmE4IHRvIDB4YjhkNDdmZjApDQo+ID4gPiBbICAgMTMuNzY2OTMyXVsgIFQ0
MTVdIDdmYTA6ICAgICAgICAgICAgICAgICAgIDAwMDAwMDZjIDAwOGZiZWEwIDAwMDAwMDAxIDAw
OGZiZWEwDQo+IDAwMDAwMDA2IDAwMDAwMDAwDQo+ID4gPiBbICAgMTMuNzc1ODExXVsgIFQ0MTVd
IDdmYzA6IDAwMDAwMDZjIDAwOGZiZWEwIDc2ZjFjZGEwIDAwMDAwMDA0IDAwMDAwMDA2DQo+IDAw
MDAwMDA2IDAwMDAwMDAwIDAwMDAwMDAwDQo+ID4gPiBbICAgMTMuNzg0Njg3XVsgIFQ0MTVdIDdm
ZTA6IDAwMDAwMDA0IDdlYmFmN2QwIDc2ZWI0YzBiIDc2ZTNmMjA2DQo+ID4gPiBbICAgMTMuNzkw
NDQyXVsgIFQ0MTVdIENvZGU6IGJhZCBQQyB2YWx1ZQ0KPiA+ID4gWyAgIDEzLjgzOTIxNF1bICBU
NDE1XSAtLS1bIGVuZCB0cmFjZSAxZmUyMWVjZmM5ZjI4ODUyIF0tLS0NCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxOU2h1YmluQHRvcGNvbi5jb20+DQo+ID4gPiBG
aXhlczogN2ExODY5NDE2MjZkICgicmVtb3RlcHJvYzogcmVtb3ZlIHRoZSBzaW5nbGUgcnBtc2cg
dmRldg0KPiA+ID4gbGltaXRhdGlvbiIpDQo+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zw0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfdmlydGlv
LmMgfCA3ICsrKysrKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+
ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX3Zp
cnRpby5jDQo+ID4gPiBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX3ZpcnRpby5jDQo+
ID4gPiBpbmRleCA4YzA3Y2IyY2E4YmEuLjMxYTYyYTBiNDcwZSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX3ZpcnRpby5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYw0KPiA+ID4gQEAgLTMzNCw2ICszMzQs
MTMgQEAgaW50IHJwcm9jX2FkZF92aXJ0aW9fZGV2KHN0cnVjdCBycHJvY192ZGV2DQo+ICpydmRl
diwgaW50IGlkKQ0KPiA+ID4gIAlzdHJ1Y3QgcnByb2NfbWVtX2VudHJ5ICptZW07DQo+ID4gPiAg
CWludCByZXQ7DQo+ID4gPg0KPiA+ID4gKwlpZiAocnByb2MtPm9wcy0+a2ljayA9PSBOVUxMKSB7
DQo+ID4gPiArCQlyZXQgPSAtRUlOVkFMOw0KPiA+ID4gKwkJZGV2X2VycihkZXYsICIua2ljayBt
ZXRob2Qgbm90IGRlZmluZWQgZm9yICVzIiwNCj4gPiA+ICsJCQkJcnByb2MtPm5hbWUpOw0KPiA+
ID4gKwkJZ290byBvdXQ7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiBTaG91bGQgdGhlIGtpY2sg
b3BzIGJlIG1hbmRhdG9yeSBmb3IgYWxsIHRoZSBwbGF0Zm9ybXM/IEhvdyBhYm91dCBtYWtpbmcN
Cj4gaXQgb3B0aW9uYWwgaW5zdGVhZD8NCj4gDQo+IEhpLCBBcm5hdWQuDQo+IA0KPiBJdCBpcyBu
b3QgbWFuZGF0b3J5LCBjdXJyZW50bHkgaXQgbXVzdCBiZSBwcm92aWRlZCBpZiBzcGVjaWZpZWQg
dmRldiBlbnRyeSBpcyBpbg0KPiByZXNvdXJzZSB0YWJsZS4gT3RoZXJ3aXNlIGl0IGxvb2tzIGxp
a2UgdGhlcmUgaXMgbm8gcG9pbnQgaW4gY3JlYXRpbmcgdmRldi4NCg0KWWVzLCBteSBxdWVzdGlv
biB3YXMgYWJvdXQgaGF2aW5nIGl0IG9wdGlvbmFsIGZvciB2ZGV2IGFsc28uIEEgcGxhdGZvcm0g
Y291bGQgaW1wbGVtZW50IHRoZSB2ZGV2DQp3aXRob3V0IGtpY2sgbWVjaGFuaXNtIGJ1dCBieSBw
b2xsaW5nIGRlcGVuZGluZyBkdWUgdG8gaGFyZHdhcmUgY2FwYWJpbGl0eS4uLg0KVGhpcyBjb3Vs
ZCBiZSBhbiBhbHRlcm5hdGl2ZSBhdm9pZGluZyB0byBpbXBsZW1lbnQgYSBkdW1teSBmdW5jdGlv
biBpbiBwbGF0Zm9ybSBkcml2ZXIuDQoNCkFueXdheSBpdCBqdXN0IGEgcHJvcG9zYWwgdGhhdCBt
YWtlcyBzZW5zZSBmcm9tIE1QT1YuIElmIEJqb3JuIGlzIG9rIHdpdGggeW91ciBwYXRjaCwgbm90
aGluZyBibG9ja2luZyBvbiBteSBzaWRlLg0KDQpSZWdhcmRzDQpBcm5hdWQNCg0KPiANCj4gDQo+
ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEFybmF1ZA0KPiA+DQo+ID4gPiAgCS8qIFRyeSB0byBmaW5k
IGRlZGljYXRlZCB2ZGV2IGJ1ZmZlciBjYXJ2ZW91dCAqLw0KPiA+ID4gIAltZW0gPSBycHJvY19m
aW5kX2NhcnZlb3V0X2J5X25hbWUocnByb2MsICJ2ZGV2JWRidWZmZXIiLA0KPiBydmRldi0+aW5k
ZXgpOw0KPiA+ID4gIAlpZiAobWVtKSB7DQo+ID4gPg0K
