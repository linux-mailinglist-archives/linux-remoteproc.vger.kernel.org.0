Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D66E166C60
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Feb 2020 02:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbgBUBfZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 20 Feb 2020 20:35:25 -0500
Received: from mail-eopbgr60057.outbound.protection.outlook.com ([40.107.6.57]:50663
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729045AbgBUBfZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Feb 2020 20:35:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8i5intzCVNB9iT9N5IknXHIcMVBKA/SIVb0ZLm6XZFd0oo2iZJ3QByu5fIXYEMK9jJh0vUFMIwR3ExhbhF/llheclY8gxERS/2uyKie4aQzvkDi0nSR4j0s940iwagTZdnixxAQ2YVJMrIRaBh3Ldc9iD9UGSpEmdW2N03SeF8r3hjtKDl27bhrWRxDPGhrPUAj308+nDpQZHGFmiid6Xlzy/GzHkqCGhm5ZbCqxiCCFJpmU33bBFv2hu0QJ1Q4+jmto0HsPBTHWeO+WG8Nb/CmVuDRUOxiR48Pexm4jf3/vDGdHEcguNEkx9Aa+q6IybUequuAdqf4mm6wX88ZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gQZqvnwwCMQqGihDxATY1PFNCSYVkXOJIzVuv6k4Q=;
 b=AmaztkqiutapW9pBbDw/E/x/9avx+QndGDgpO9S3cOQaE4w78blo/8CVT94hr/KBAuKBF7qVQJzKGcFiIEsSXJ3wNiuYDlSqjRtq0UNE8JObVrIV8/wvDgph6OL7CcQLKqqt1/+XJZ9xvBZkuYz608QOo+lw/pJ/mh3V3ljqucrKbCkZ65GrXpLhk3kBenfFqYSHWCUMQHHsJ8v7DEPyCc5f0bc1BJS+UdgAfGA81BKgMo3UPPk8frUb66DdmiI9UyEcJLOD9hpRkD+SCduWJti61JufLbowrcvbagvQJxE3OZr2HgE+eISLkGz7ckWYxK8MWRHGahOkugpv2WoQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gQZqvnwwCMQqGihDxATY1PFNCSYVkXOJIzVuv6k4Q=;
 b=p6IHtzhRTzlp9cyNKclEH1y0kDuZUBbUWjYAGyN+5sRSuFZpC72hIX7Mokqh3bQj1+UHF95Dh/nKRdzKmLja+MfShgTuqDBTisk9/GoqIpX1M+hpys900dB1RtY/2C8L3bTsYXIecBmPTyd6jBH9QBlwvhESYEIICGaAq3agAvg=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4257.eurprd04.prod.outlook.com (52.134.124.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 21 Feb 2020 01:35:19 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 01:35:19 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Thread-Topic: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Thread-Index: AQHV5vbmWntOo1W/0E+zZvFdhH2I6Kgi1bgAgAB3WRCAAU11gIAAROWg
Date:   Fri, 21 Feb 2020 01:35:19 +0000
Message-ID: <AM0PR04MB4481446CA33057E2138C077B88120@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <CANLsYkzeAyGhYqewGaHfd-myW5EzE83WUOwAbKwTP-34pbUR-w@mail.gmail.com>
 <AM0PR04MB448114DF702180D0CF0553A688130@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CANLsYkx_6R_rJ198k4bf2Y4q6WqfHj9bzFzdBFhgOEFrwjcLeQ@mail.gmail.com>
In-Reply-To: <CANLsYkx_6R_rJ198k4bf2Y4q6WqfHj9bzFzdBFhgOEFrwjcLeQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b78e413a-6c72-4fcf-665d-08d7b66e4f9b
x-ms-traffictypediagnostic: AM0PR04MB4257:|AM0PR04MB4257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB42572BAF360651A0DF1C709788120@AM0PR04MB4257.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(6506007)(966005)(44832011)(5660300002)(7696005)(6916009)(4326008)(478600001)(186003)(45080400002)(26005)(33656002)(66946007)(2906002)(9686003)(8676002)(81156014)(7416002)(55016002)(81166006)(316002)(66446008)(86362001)(66476007)(54906003)(71200400001)(64756008)(52536014)(8936002)(66556008)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4257;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MqZJJP2KzZAPWtfKCyScSfqSNx1G8YrGCgFyipyUoX6utZlzbQS8L6Fd9qJ8rGDYba8ArGwhuQmkLqY7ZCeB9FNxnqw6OKAdI8yODfoSSgMR4btVvj12FXfIAi8cM1TdBnhuTsPg6UMB5FFgElJy2X2ndFvKFe2+ZqVlNwal/jpSO/L/BG0y9lcLLSoxEcH4NiT6GghzwUgk1Hv/GLs5YUbXYuUxWZhBC3wXk5yCJ01AdXsj/OCr6YxDxg6rCmtmjf+k2DQWE2gZ3Ss4h/cYy+Ok4HL/QkiRstnDn7IWp5KWrQZmgMG1N7HVKUS2ibBg98GV+JW4597VRtnSlnUZKCVlRoehGyOO7fUFlKFg5C8ZFzAaiOLotqWNJlcn+owPgi706M+92Ijvxsg1ZC52iU/JpmafIKWT2x7pxIJHDP5vIb0bk5wWsRxGSY4WLY7fCQQ3IqjRaI6juWelsmz/X/NGh2E+BzJrMwSnbP+57FQSjy9pJBXSPto7aOEe2LfioUoUSUcpRn2pgtaXCd5zM7O9BsjLHKrmOj8Lghx2laWcmlCz8ZP1/SfaKnV5PdAkG3nlFqa4oDW580TQvwGyGg==
x-ms-exchange-antispam-messagedata: BhIoV0CXEOZuwG1sUM4GEFl32Ml72wW9PwaDVWlonm+pI5pDG1yVqudN1JN3XC3fZP1NfEH1tZfHp5ZiaW3JnutRf+tgxkaiFMLNEFOPu+LTB8H9ydm9pBDZlNtyTj5h10owCiMiqkmiF3wR2QIgAQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78e413a-6c72-4fcf-665d-08d7b66e4f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 01:35:19.3427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPDttdMJgW0qsxT99is8nj+GOquaPBuRwuJS+iqhhdsvab/PdyGTPjnv8lyI+REP8I1XSUHB8Xv1zJVZN870Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4257
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvOV0gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBzdXBwb3J0
IGkuTVg4LzhNLzdVTFANCj4gDQo+IE9uIFdlZCwgMTkgRmViIDIwMjAgYXQgMTg6MzYsIFBlbmcg
RmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIE1hdGhpZXUsDQo+ID4N
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC85XSByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHN1
cHBvcnQNCj4gPiA+IGkuTVg4LzhNLzdVTFANCj4gPiA+DQo+ID4gPiBIaSBQZW5nLA0KPiA+ID4N
Cj4gPiA+IE9uIFdlZCwgMTkgRmViIDIwMjAgYXQgMDA6MzMsIDxwZW5nLmZhbkBueHAuY29tPiB3
cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2hzZXQgYWltIHRvIHJlcGxhY2UgTlhQIHZlbmRv
ciBpbXhfcnBtc2cuYyBkcml2ZXIuDQo+ID4gPg0KPiA+ID4gWW91IG1lYW4gcmVtb3RlcHJvYy9p
bXhfcnByb2MuYyA/ICBVcHN0cmVhbSBycG1zZy9pbXhfcnBtc2cuYw0KPiA+ID4gZG9lc24ndCBl
eGlzdC4NCj4gPg0KPiA+IGlteF9ycG1zZy5jIG9ubHkgaW4gTlhQIHZlbmRvciB0cmVlLiBUaGlz
IHBhY2hzZXQgaXMgdG8gdXNlDQo+ID4gaW14X3Jwcm9jLmMgZm9yIHJwbXNnL3ZpcnRpbyBmdW5j
dGlvbnMgZm9yIGkuTVggU29DLg0KPiA+DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIHBh
dGNoc2V0IGlzIHRlc3RlZCB3aXRoIExvaWMgUEFMTEFSRFkncyBwYXRjaA0KPiA+ID4gPiAicmVt
b3RlcHJvYzogYWRkIHN1cHBvcnQgZm9yIGNvLXByb2Nlc3NvciBsb2FkZWQgYW5kIGJvb3RlZCBi
ZWZvcmUNCj4gPiA+IGtlcm5lbCINCj4gPiA+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGDQo+ID4gPiA+IHBhdGMNCj4g
PiA+ID4NCj4gPiA+DQo+IGh3b3JrLmtlcm5lbC5vcmclMkZwYXRjaCUyRjExMjY1ODY5JTJGJmFt
cDtkYXRhPTAyJTdDMDElN0NwZW5nLmYNCj4gPiA+IGFuJTQwbg0KPiA+ID4gPg0KPiA+ID4NCj4g
eHAuY29tJTdDZTFjYjE5ZTUzNWExNGI2M2QwZGEwOGQ3YjU2OGZkNTYlN0M2ODZlYTFkM2JjMmI0
YzZmYTkNCj4gPiA+IDJjZDk5YzVjDQo+ID4gPiA+DQo+ID4gPg0KPiAzMDE2MzUlN0MwJTdDMCU3
QzYzNzE3NzMzNDgzOTQ5NzgzMiZhbXA7c2RhdGE9YUtRJTJCdWxjbzYzYmENCj4gPiA+IFlUJTJC
RFpEazANCj4gPiA+ID4gVkx0MU5wa051aHJZM3NzeGlSQ09jck0lM0QmYW1wO3Jlc2VydmVkPTAs
DQo+ID4gPiA+IGFuZCBpbnNwcmllZCBmcm9tIHN0J3MgcmVtb3RlcHJvYyBlYXJseSBib290IHN1
cHBvcnQuDQo+ID4gPiA+IFNpbmNlIExvaWMncyBwYXRjaCBpcyBzdGlsbCB1bmRlciByZXZpZXcs
IGp1c3QgZXhwZWN0IHlvdXINCj4gPiA+ID4gY29tbWVudHMgOikNCj4gPiA+DQo+ID4gPiBEaWQg
eW91IGJhc2UgeW91ciB3b3JrIG9uIHRvcCBvZiBMb2ljJ3MgYmVjYXVzZSB5b3VyIE1DVSBmaXJt
d2FyZSBpcw0KPiA+ID4gYWx3YXlzIGxvYWRlZCBieSB0aGUgYm9vdGxvYWRlcj8NCj4gPg0KPiA+
IEkgb25seSB0b29rIExvaWMncyBlYXJseS1ib290IHBhdGNoIGFzIGJhc2UgYW5kIGFwcGx5IG15
IHBhdGNoc2V0Lg0KPiA+DQo+ID4gVGhlIG1jdSBmaXJtd2FyZSBjdXJyZW50bHkgb25seSBsb2Fk
ZWQgYnkgYm9vdGxvYWRlciBvciBzeXN0ZW0gY29udHJvbGxlcg0KPiBmaXJtd2FyZS4NCj4gPiBO
WFAgcmVsZWFzZWQgbWN1IGZpcm13YXJlIG5vdCBzdXBwb3J0IGJlaW5nIGxvYWRlZCBieSBMaW51
eCByZW1vdGVwcm9jLg0KPiANCj4gVGhhbmtzIGZvciBicmluZ2luZyB0aGlzIHVzZSBjYXNlIHRv
IHRoZSBmcm9udC4gIEkgc3VzcGVjdGVkIHN1Y2ggYSBzY2VuYXJpbw0KPiBleGlzdGVkIGJ1dCBk
aWRuJ3Qgc3BlbmQgdG9vIG11Y2ggdGltZSB0aGlua2luZyBhYm91dCBpdCBzaW5jZSBub25lIGhh
ZCBiZWVuDQo+IGJyb3VnaHQgdG8gb3VyIGF0dGVudGlvbi4gDQoNCkFjdHVhbGx5IHRvIGkuTVg3
VUxQLCBNNCBpcyBib290ZWQgZmlyc3QgZnJvbSBoYXJkd2FyZSBkZXNpZ24gYW5kIGl0DQpjb250
cm9scyBldmVyeSB0aGluZ3MsIEE3IGlzIHVuZGVyIGNvbnRyb2wgb2YgTTQNCg0KVG8gaS5NWDgv
OFgsIE00IGlzIGJvb3RlZCBieSBzeXN0ZW0gY29udHJvbCB1bml0IGZpcm13YXJlIGZvciBxdWlj
ayBib290DQpmb3IgYXV0b21vdGl2ZSBDQU4gYW5kIExpbnV4IGlzIGJvb3RlZCBsYXRlci4gTGlu
dXggY291bGQgb25seSBJUEMgdG8gTTQsDQphbmQgbm90aGluZyBlbHNlLg0KDQpUbyBpLk1YOE0s
IE00IGlzIGJvb3RlZCBieSBib290bG9hZGVyLCBidXQgaXQgY291bGQgYWxzbyBiZSBib290ZWQg
YnkgTGludXgsDQpJdCBpcyBqdXN0IE5YUCBvbmx5IHN1cHBvcnQgYm9vdGxvYWRlciBjYXNlLg0K
DQogSSB3aWxsIHJldmlldyB5b3VyIHBhdGNoc2V0IGFuZCBjb250aW51ZSB0aGUNCj4gY29udmVy
c2F0aW9uIHdpdGggQXJuYXVkIHdpdGggaXQgaW4gbWluZC4gIEkgYWxzbyBpbnZpdGUgeW91IHRv
IGpvaW4gdGhhdA0KPiBjb252ZXJzYXRpb24uDQoNCkFwcHJlY2lhdGUuDQoNClRoYW5rcywNClBl
bmcuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hdGhpZXUNCj4gDQo+ID4NCj4gPiAgSWYgbm90IHBs
ZWFzZSBzZW5kIGFub3RoZXIgcmV2aXNpb24gb2YgeW91ciB3b3JrDQo+ID4gPiB3aXRob3V0IGVh
cmx5IGJvb3Qgc3VwcG9ydC4gIFdoZW4gd2UgaGF2ZSBhIGNsZWFyIHZpZXcgb24gaG93IHRvDQo+
ID4gPiBwcm9jZWVkIHdpdGggdGhlIGVhcmx5IGJvb3Qgc3VwcG9ydCB5b3UgY2FuIHNlbmQgYW5v
dGhlciBzZXQgdG8gZW5hYmxlDQo+IHRoYXQuDQo+ID4NCj4gPiBJJ2xsIHdhaXQgeW91ciBuZXcg
cGF0Y2ggZm9yIGVhcmx5IGJvb3QgaW4gcmVtb3RlcHJvYy1jb3JlLiBUaGVuIEknbGwNCj4gPiBy
ZWJhc2UgYW5kIHNlbmQgYSBuZXcgdmVyc2lvbi4gU2luY2UgSSBpbnRyb2R1Y2UgYmlnIGNoYW5n
ZXMgdG8NCj4gPiBpbXhfcnByb2MuYywgc28gSSdsbCBzZWUgd2hldGhlciBhbnkgY29tbWVudHMg
dGhlcmUuDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gUGVuZy4NCj4gPg0KPiA+ID4NCj4gPiA+IFRo
YW5rcywNCj4gPiA+IE1hdGhpZXUNCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFBhdGNoIFsxLDJd
Lzk6IGR0LWJpbmRpbmdzIGNvbnZlcnQgdG8ganNvbiBhbmQgbmV3IFNvQyBzdXBwb3J0DQo+ID4g
PiA+IFBhdGNoDQo+ID4gPiA+IDMvOTogc2tpcCBmaXJtd2FyZSBsb2FkIHdoZW4gcmVjb3Zlcnku
IFRvIGkuTVg4LCBmaXJtd2FyZSBpcyBub3QNCj4gPiA+ID4gICAgICAgICAgICBoYW5kbGVkIGJ5
IExpbnV4Lg0KPiA+ID4gPg0KPiA+ID4gPiBQYXRjaCBbNC05XS85OiBpLk1YIHNwZWNpZmljIHBh
cnQgdG8gc3VwcG9ydCBycG1zZy92aXJ0aW8gd2l0aCBtYm94Lg0KPiA+ID4gPiAgICAgICBiZWNh
dXNlIE5YUCByZWxlYXNlIGltYWdlIG5vdCBoYXZlIHJlc291cmUgdGFibGUsIHNvIGFkZA0KPiBy
ZXNvdXJjZQ0KPiA+ID4gPiAgICAgICB0YWJsZSBpbiBkdHMNCj4gPiA+ID4NCj4gPiA+ID4gTXkg
dGVzdCBkdHMgZGlmZiBmb3IgaS5NWDhRWFAgTUVLLCBidXQgSSBoYXZlIHRlc3RlZCB0aGlzIHBh
dGNoc2V0DQo+ID4gPiA+IGZvciBpLk1YOFFYUCBNRUssIGkuTVg4TU0gRVZLLCBpLk1YN1VMUCBF
Vks6DQo+ID4gPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBpbXg4eC1jbTQgew0KPiA+
ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1jbTQiOw0KPiA+
ID4gPiArICAgICAgICAgICAgICAgcnNyYy10YWJsZSA9IDwNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgMHgxIDB4MiAweDAgMHgwIDB4MTggMHg1Yw0KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAzDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qZndfcnNj
X3ZkZXYqLw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICA3IDAgMSAwIDAgMHgyMDAN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLypmd19yc2NfdmRldl92cmluZyovDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4OTAwMDAwMDAgNDA5NiAyNTYgMSAwDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4OTAwMDgwMDAgNDA5NiAyNTYgMiAwDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDMNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgLypmd19yc2NfdmRldiovDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IDcgMSAxIDAgMCAweDIwMA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKmZ3X3Jz
Y192ZGV2X3ZyaW5nKi8NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgMHg5MDAxMDAw
MCA0MDk2IDI1NiAxIDANCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgMHg5MDAxODAw
MCA0MDk2IDI1NiAyIDANCj4gPiA+ID4gKyAgICAgICAgICAgICAgID47DQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICBlYXJseS1ib290ZWQ7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBtYm94LW5h
bWVzID0gInR4IiwgInJ4IiwgInJ4ZGIiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgbWJveGVz
ID0gPCZsc2lvX211NSAwIDENCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAmbHNp
b19tdTUgMSAxDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgJmxzaW9fbXU1IDMg
MT47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBtdWItcGFydGl0aW9uID0gPDM+Ow0KPiA+ID4g
PiArICAgICAgICAgICAgICAgbWVtb3J5LXJlZ2lvbiA9IDwmdmRldjB2cmluZzA+LCA8JnZkZXYw
dnJpbmcxPiwNCj4gPiA+IDwmdmRldjBidWZmZXI+LA0KPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmdmRldjF2cmluZzA+LA0KPiA8JnZkZXYxdnJpbmcxPiwNCj4gPiA+
IDwmdmRldjBidWZmZXI+Ow0KPiA+ID4gPiArICAgICAgIH07DQo+ID4gPiA+ICsNCj4gPiA+ID4g
KyAgICAgICByZXNlcnZlZC1tZW1vcnkgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwy
PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJhbmdlczsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgdmRldjB2cmluZzA6IHZkZXYwdnJpbmcwQDkwMDAwMDAwIHsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wi
Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDkwMDAwMDAwIDAg
MHg4MDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbm8tbWFwOw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
dmRldjB2cmluZzE6IHZkZXYwdnJpbmcxQDkwMDA4MDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDkwMDA4MDAwIDAgMHg4MDAwPjsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbm8tbWFwOw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgdmRldjF2cmluZzA6IHZk
ZXYxdnJpbmcwQDkwMDEwMDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MCAweDkwMDEwMDAwIDAgMHg4MDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgbm8tbWFwOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICAgICAgICAgICAgICAgdmRldjF2cmluZzE6IHZkZXYxdnJpbmcxQDkwMDE4
MDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFy
ZWQtZG1hLXBvb2wiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAw
eDkwMDE4MDAwIDAgMHg4MDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbm8t
bWFwOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgdmRldjBidWZmZXI6IHZkZXYwYnVmZmVyIHsNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOw0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDkwNDAwMDAwIDAgMHgxMDAwMDA+Ow0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBuby1tYXA7DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICB9Ow0KPiA+ID4gPiArICAgICAgIH07DQo+ID4gPiA+ICsNCj4gPiA+ID4NCj4gPiA+
ID4gUGVuZyBGYW4gKDkpOg0KPiA+ID4gPiAgIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBDb252
ZXJ0IGlteC1ycHJvYyB0byBqc29uLXNjaGVtYQ0KPiA+ID4gPiAgIGR0LWJpbmRpbmdzOiByZW1v
dGVwcm9jOiBpbXgtcnByb2M6IHN1cHBvcnQgaS5NWFs4LDhNLDdVTFBdDQo+ID4gPiA+ICAgcmVt
b3RlcHJvYzogYWRkIHN1cHBvcnQgdG8gc2tpcCBmaXJtd2FyZSBsb2FkIHdoZW4gcmVjb3ZlcnkN
Cj4gPiA+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHN1cnBvcnQgZWFybHkgYm9vdGVkIHJl
bW90ZSBwcm9jZXNzb3INCj4gPiA+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IHBhcnNlIGVh
cmx5LWJvb3RlZCBwcm9wZXJ0eQ0KPiA+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9wcm9jOiBlbmFi
bGUgdmlydGlvL21haWxib3gNCj4gPiA+ID4gICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IGFkZCBp
Lk1YOFFNL1FYUA0KPiA+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogc3VwcG9ydCBpLk1Y
N1VMUA0KPiA+ID4gPiAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogYWRkIGkuTVg4TU0gc3VwcG9y
dA0KPiA+ID4gPg0KPiA+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9p
bXgtcnByb2MudHh0ICAgfCAgMzMgLS0NCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlbW90ZXByb2MvaW14LXJwcm9jLnlhbWwgIHwgIDk1ICsrKysrDQo+ID4gPiA+ICBkcml2ZXJz
L3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgICAgICAgICAgICAgICAgICAgICB8IDQ1NQ0KPiA+ID4g
KysrKysrKysrKysrKysrKysrKy0tDQo+ID4gPiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY19jb3JlLmMgICAgICAgICAgICAgICB8ICAxOSArLQ0KPiA+ID4gPiAgaW5jbHVkZS9saW51
eC9yZW1vdGVwcm9jLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gPiAg
NSBmaWxlcyBjaGFuZ2VkLCA1MzEgaW5zZXJ0aW9ucygrKSwgNzIgZGVsZXRpb25zKC0pICBkZWxl
dGUgbW9kZQ0KPiA+ID4gPiAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlbW90ZXByb2MvaW14LXJwcm9jLnR4dA0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL2lteC1y
cHJvYy55YW1sDQo+ID4gPiA+DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMTYuNA0KPiA+ID4gPg0K
