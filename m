Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21CA35B6E9
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jul 2019 10:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfGAIeC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jul 2019 04:34:02 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:21795
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727176AbfGAIeC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jul 2019 04:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IBWTns70/XMt3MlxwdiFLOpelMkSq1B0urghU0TsLk=;
 b=kziNvTcDwDE2SnuFae6hBNWDH34pW+lW3qDMkHUtiF4lI6PFB0Yi9aeBQzn/ucYYZz6OEJ5A0WGzWXcXu2Sv+Wj4EJ5BidCn23drL/ZyCZJU1uE8zjelYXMqBe1+3wz48LjJy5j7QCbU6hbL4sday4CoB4AroGIT17JzJMKLlao=
Received: from AM0PR0402MB3570.eurprd04.prod.outlook.com (52.133.46.11) by
 AM0PR0402MB3842.eurprd04.prod.outlook.com (52.133.34.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 08:34:00 +0000
Received: from AM0PR0402MB3570.eurprd04.prod.outlook.com
 ([fe80::dd66:8e13:93f0:65eb]) by AM0PR0402MB3570.eurprd04.prod.outlook.com
 ([fe80::dd66:8e13:93f0:65eb%7]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 08:34:00 +0000
From:   Richard Zhu <hongxing.zhu@nxp.com>
To:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [RFC 1/2] dt-binding: add imx rpmsg compatibility documentation
Thread-Topic: [RFC 1/2] dt-binding: add imx rpmsg compatibility documentation
Thread-Index: AQHVL+e7C93AkdmlXEa1zEYGHM5qZg==
Date:   Mon, 1 Jul 2019 08:34:00 +0000
Message-ID: <1561968784-1124-2-git-send-email-hongxing.zhu@nxp.com>
References: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
In-Reply-To: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::16) To AM0PR0402MB3570.eurprd04.prod.outlook.com
 (2603:10a6:208:1c::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hongxing.zhu@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 859d3848-1b85-4fd2-aed0-08d6fdfedd82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR0402MB3842;
x-ms-traffictypediagnostic: AM0PR0402MB3842:
x-microsoft-antispam-prvs: <AM0PR0402MB38424AA62DC111B2290032768CF90@AM0PR0402MB3842.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(305945005)(86362001)(446003)(186003)(6506007)(386003)(486006)(2616005)(476003)(76176011)(7736002)(256004)(102836004)(14444005)(11346002)(26005)(50226002)(66066001)(2501003)(8936002)(36756003)(8676002)(81156014)(81166006)(6116002)(3846002)(2906002)(52116002)(99286004)(68736007)(5660300002)(478600001)(25786009)(71200400001)(14454004)(4326008)(71190400001)(73956011)(66946007)(6486002)(6436002)(316002)(66476007)(53936002)(66446008)(54906003)(6512007)(110136005)(2201001)(64756008)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR0402MB3842;H:AM0PR0402MB3570.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9IcPzTLJGaakrT/jF1fWHitt4q3YX+pSXD2m2I6qYj03Q8RKXwoNELm+JEzsDWxRO1z7GAWZVX58Vlw77bN1GFuaZkmMzfriRXpyErqEoxIMzfF6/X++99ZPmXDLprx+tjSXSSZF8pIT8CXR8spJUpJid37hZzXx3j6zUpIw6XsBOsYjD5hMypyu3SUxEForRa6R6zrvT6naDbEa41sy3TK2kmxPk9B/VVqd4HdDVmE7twgLDGDmG6DcXlCuAarh4tMyCiXPX5AIrWoYCDufwdr2X9wKfcNB6gyzq/AZR26eRyPZRvbDeimKBrsZodvR/YiJ/jQC73CYDqI+4HcAMwiCWzuS17uJEnfld0xtZxZgOmEYh8SXOD+3oZrXGkcmO7jzvFB8gNPHsAN5d+n3NHHZlaVd7nwF4ANsLzNd8YM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859d3848-1b85-4fd2-aed0-08d6fdfedd82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 08:34:00.1972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hongxing.zhu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3842
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

QWRkIGlteCBycG1zZyBjb21wYXRpYmlsaXR5IGRvY3VtZW50YXRpb24uDQoNClNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCi0tLQ0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvYy9mc2wvZnNsLHJwbXNnLnR4dCAgICAgIHwgNzUgKysrKysrKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2ZzbCxy
cG1zZy50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvZnNsL2ZzbCxycG1zZy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL2ZzbC9mc2wscnBtc2cudHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMC4uNzI2Nzc1Ng0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvYy9mc2wvZnNsLHJwbXNnLnR4dA0KQEAgLTAsMCArMSw3NSBAQA0KK2ku
TVggUlBNU0cgcGxhdGZvcm0gaW1wbGVtZW50YXRpb25zDQorDQorRGlzdHJpYnV0ZWQgZnJhbWV3
b3JrIGlzIHVzZWQgaW4gSU1YIFJQTVNHIGltcGxlbWVudGF0aW9uLCByZWZlciB0byB0aGUNCitm
b2xsb3dpbmcgcmVxdWlyZW1lbnRzOg0KKyAgLSBUaGUgQ0FOIGZ1bmN0aW9ucyBjb250YWluZWQg
aW4gTSBjb3JlIGFuZCBSVE9TIHNob3VsZCBiZSByZWFkeSBhbmQNCisgICAgY29tcGxldGUgZnVu
Y3Rpb25hbCBpbiA1MG1zIGFmdGVyIEFNUCBzeXN0ZW0gaXMgdHVybmVkIG9uLg0KKyAgLSBQYXJ0
aXRpb24gcmVzZXQuIFN5c3RlbSB3b3VsZG4ndCBiZSBzdGFsbGVkIGJ5IHRoZSBleGNlcHRpb25z
IChlLngNCisgICAgdGhlIHJlc2V0IHRyaWdnZXJlZCBieSB0aGUgc3lzdGVtIGhhbmcpIG9jY3Vy
cmVkIGF0IHRoZSBvdGhlciBzaWRlLg0KKyAgICBBbmQgdGhlIFJQTVNHIG1lY2hhbmlzbSBzaG91
bGQgYmUgcmVjb3ZlcmVkIGF1dG9tYWN0aWxseSBhZnRlciB0aGUNCisgICAgcGFydGl0aW9uIHJl
c2V0IGlzIGNvbXBsZXRlZC4NCitJbiB0aGlzIHNjZW5hcmlvLCB0aGUgTSBjb3JlIGFuZCBSVE9T
IHdvdWxkIGJlIGtpY2tlZCBvZmYgYnkgYm9vdGxvYWRlcg0KK2ZpcnN0bHksIHRoZW4gQSBjb3Jl
IGFuZCBMaW51eCB3b3VsZCBiZSBsb2FkZWQgbGF0ZXIuIEJvdGggTSBjb3JlL1JUT1MNCithbmQg
QSBjb3JlL0xpbnV4IGFyZSBydW5uaW5nIGluZGVwZW5kbHkuDQorT25lIHBoeXNpY2FsIG1lbW9y
eSByZWdpb24gdXNlZCB0byBzdG9yZSB0aGUgdnJpbmcgaXMgbWFuZGF0b3J5IHJlcXVpcmVkDQor
dG8gcHJlLXJlc2VydmVkIGFuZCB3ZWxsLWtub3duZWQgYnkgYm90aCBBIGNvcmUgYW5kIE0gY29y
ZQ0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlOiAiZnNsLGlteDhxeHAt
cnBtc2ciLCAiZnNsLGlteDhtcS1ycG1zZyIuDQorLSB2ZGV2LW51bXM6IFRoZSBudW1iZXIgb2Yg
dGhlIHJlbW90ZSB2aXJ0dWFsIGRldmljZXMuDQorLSByZWc6IFRoZSByZXNlcnZlZCBwaGlzaWNh
bCBERFIgbWVtb3J5IHVzZWQgdG8gc3RvcmUgdnJpbmcgZGVzY3JpcHRvcnMuDQorDQorT3B0aW9u
YWwgcHJvcGVydGllczoNCistIHJwbXNnX2RtYV9yZXNlcnZlZDogVGhlIHJlc2VydmVkIHBlciBk
ZXZpY2UgZG1hIHBvb2wsIHRoYXQgdXNlZCB0bw0KKyAgYWxsb2NhdGUgdGhlIHNoYXJlZCBtZW1v
cnkgYnVmZmVycyBmcm9tIHRoZSBwZXIgZGV2aWNlLg0KKyAgQW5kIGl0IGlzIG9wdGlvbmFsIGZv
ciBzb21lIHBsYXRmb3Jtcywgc2luY2UgdGhlIHN5c3RlbSBkbWEgcG9vbA0KKyAgaXMgdXNlZCB0
byBhbGxvY2F0ZSB0aGUgc2hhcmVkIG1lbW9yeSBidWZmZXJzIGRpcmVjdGx5IG9uIHRoZW0uDQor
LSBtdWItcGFydGl0aW9uOiBUaGUgcGFydGl0aW9uIElEIG9mIG11QiBzaWRlLCB0aGF0J3Mgb3B0
aW9uYWwNCisgIGFuZCB1c2VkIG9uIGkubXg4cW0vOHF4cCBmb3IgcGFydGl0aW9uIHJlc2V0LiBU
aGUgZGVmYXVsdA0KKyAgdmFsdWUgaXMgMyBpbiBkcml2ZXIgd2l0aG91dCB0aGlzIHByb3BlcnR5
Lg0KKw0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KK01haWxib3ggdXNlZCBieSBpTVggUlBNU0cNCisNCistIG1i
b3hlczogbWFpbGJveGVzIHVzZWQgaW4gdGhlIFJQTVNHIHRyYW5zYWN0aW9ucy4NCistIG1ib3gt
bmFtZXM6IG5hbWVzIG9mIHRoZSBtYWlsYm94ZXMgdXNlZCBpbiBSUE1TRy4NCisJLSAidHgiOlRY
IGNoYW5uZWwgd2l0aCAzMmJpdCB0cmFuc21pdCByZWdpc3RlciBhbmQgSVJRIHRyYW5zbWl0DQor
CS0gInJ4IjpSWCBjaGFubmVsIHdpdGggMzJiaXQgcmVjZWl2ZSByZWdpc3RlciBhbmQgSVJRIHN1
cHBvcnQNCisJLSAicnhkYiI6UlggZG9vcmJlbGwgY2hhbm5lbC4NCisNCitFeGFtcGxlOg0KK1Jw
bXNnIG5vZGUgaW4gYm9hcmQgZHRzIGZpbGUuDQorJnJwbXNnew0KKwkvKg0KKwkgKiA2NEsgZm9y
IG9uZSBycG1zZyBpbnN0YW5jZToNCisJICovDQorCXZkZXYtbnVtcyA9IDwyPjsNCisJcmVnID0g
PDB4MCAweDkwMDAwMDAwIDB4MCAweDIwMDAwPjsNCisJc3RhdHVzID0gIm9rYXkiOw0KK307DQor
DQorU09DIGxldmVsIGR0cyBub2RlIGRlZmluaXRpb25zOg0KK3JwbXNnX3Jlc2VydmVkOiBycG1z
Z0AweDkwMDAwMDAwIHsNCisJbm8tbWFwOw0KKwlyZWcgPSA8MCAweDkwMDAwMDAwIDAgMHg0MDAw
MDA+Ow0KK307DQorcnBtc2dfZG1hX3Jlc2VydmVkOnJwbXNnX2RtYUAweDkwNDAwMDAwIHsNCisJ
Y29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOw0KKwluby1tYXA7DQorCXJlZyA9IDwwIDB4
OTA0MDAwMDAgMCAweDFDMDAwMDA+Ow0KK307DQorcnBtc2c6IHJwbXNnew0KKwljb21wYXRpYmxl
ID0gImZzbCxpbXg4cXhwLXJwbXNnIjsNCisJLyogdXAgdG8gbm93LCB0aGUgZm9sbG93aW5nIGNo
YW5uZWxzIGFyZSB1c2VkIGluIGlteCBycG1zZw0KKwkgKiAtIHR4MS9yeDE6IG1lc3NhZ2VzIGNo
YW5uZWwuDQorCSAqIC0gZ2VuZXJhbCBpbnRlcnJ1cHQxOiByZW1vdGUgcHJvYyBmaW5pc2ggcmUt
aW5pdCBycG1zZyBzdGFjaw0KKwkgKiAgIHdoZW4gQSBjb3JlIGlzIHBhcnRpdGlvbiByZXNldC4N
CisJICovDQorCW1ib3gtbmFtZXMgPSAidHgiLCAicngiLCAicnhkYiI7DQorCW1ib3hlcyA9IDwm
bHNpb19tdTUgMCAxDQorCQkgICZsc2lvX211NSAxIDENCisJCSAgJmxzaW9fbXU1IDMgMT47DQor
CW11Yi1wYXJ0aXRpb24gPSA8Mz47DQorCW1lbW9yeS1yZWdpb24gPSA8JnJwbXNnX2RtYV9yZXNl
cnZlZD47DQorCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorfTsNCi0tIA0KMi43LjQNCg0K
