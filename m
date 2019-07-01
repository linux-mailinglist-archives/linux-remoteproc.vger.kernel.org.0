Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844825B6E8
	for <lists+linux-remoteproc@lfdr.de>; Mon,  1 Jul 2019 10:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfGAIeA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 1 Jul 2019 04:34:00 -0400
Received: from mail-eopbgr60072.outbound.protection.outlook.com ([40.107.6.72]:56718
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727176AbfGAIeA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jul 2019 04:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQh6Fy3E+hcKkt3f+QNIH3RY7wYnuSGsYLbdOadJ/Hw=;
 b=nCcO8C+pP02+Pwm/X5X/1kcLfmVTeTCdG8TeZzeTTfH1OAfDiu8S77Px9JWThuPg1KWUQotH3RimRWgDhYOsxgW9d4butBY5UA+JUoejWSoxgpD15LUvW8drsw/66dCXnkz/ctqb7rKHYHgCblg6qc///7u7RLI9gksBZHYRQBY=
Received: from AM0PR0402MB3570.eurprd04.prod.outlook.com (52.133.46.11) by
 AM0PR0402MB3842.eurprd04.prod.outlook.com (52.133.34.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 08:33:58 +0000
Received: from AM0PR0402MB3570.eurprd04.prod.outlook.com
 ([fe80::dd66:8e13:93f0:65eb]) by AM0PR0402MB3570.eurprd04.prod.outlook.com
 ([fe80::dd66:8e13:93f0:65eb%7]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 08:33:58 +0000
From:   Richard Zhu <hongxing.zhu@nxp.com>
To:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [RFC 0/2] rpmsg: imx: add the initial imx rpmsg support
Thread-Topic: [RFC 0/2] rpmsg: imx: add the initial imx rpmsg support
Thread-Index: AQHVL+e5ybVlx9aCkkKHdbVfPkVZZw==
Date:   Mon, 1 Jul 2019 08:33:57 +0000
Message-ID: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
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
x-ms-office365-filtering-correlation-id: 83ab4347-f5f4-4328-b8e1-08d6fdfedbfe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR0402MB3842;
x-ms-traffictypediagnostic: AM0PR0402MB3842:
x-microsoft-antispam-prvs: <AM0PR0402MB3842891462D386A4BBA377158CF90@AM0PR0402MB3842.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(305945005)(86362001)(186003)(6506007)(386003)(486006)(2616005)(476003)(7736002)(256004)(102836004)(26005)(50226002)(66066001)(2501003)(8936002)(36756003)(8676002)(81156014)(81166006)(6116002)(3846002)(2906002)(52116002)(99286004)(68736007)(5660300002)(478600001)(25786009)(71200400001)(14454004)(4326008)(71190400001)(4744005)(73956011)(66946007)(6486002)(6436002)(316002)(66476007)(53936002)(66446008)(6512007)(110136005)(2201001)(64756008)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR0402MB3842;H:AM0PR0402MB3570.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fWaSYzVGIkDUHWtxvzU+aKOPYKHZFhRxYWrYoetXV9R+0sP3sVxHcGeqdGuLbaZNe5gXr2QLokBXI9LxEkZta19xIXKhiwTzHm4I7lpkdsbsPTpHFWhgNixgdfWKXOFq6LtoTToVWDFIlYwF2xqsB+bU8OHLUu7+/7O2tIjq5LDrnZXypOlM9+BlBmzZDaGrpGkPMwoOXNcozsZ4Wr80j/QxntwbJZOjoQ8eSDq0H6UH7my71tpKAR0/xV271XYTdEUTrcUqgkCoYfwUwNRHoHQKQ/Ho93Ktpj2e1mc6i3GY4RCrTCCPf7NzxMJBvClLG2V8fZCv4uP+3z2H9KR3jBoaIbKxlRdp7zPm7iFNyFCTtzIqDOixiP3OvoEKdhuKbuVPuPNFV8SiRMUIup9qOQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ab4347-f5f4-4328-b8e1-08d6fdfedbfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 08:33:57.9145
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

IFtSRkMgMS8yXSBkdC1iaW5kaW5nOiBhZGQgaW14IHJwbXNnIGNvbXBhdGliaWxpdHkgZG9jdW1l
bnRhdGlvbg0KIFtSRkMgMi8yXSBycG1zZzogaW14OiBhZGQgdGhlIGluaXRpYWwgaW14IHJwbXNn
IHN1cHBvcnQNCg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9mc2wvZnNs
LHJwbXNnLnR4dCB8ICA3NSArKysrKysrKysrDQpkcml2ZXJzL3JwbXNnL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrKysNCmRyaXZlcnMvcnBtc2cvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KZHJpdmVycy9y
cG1zZy9pbXhfcnBtc2cuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDU0MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KZHJpdmVycy9ycG1zZy9pbXhfcnBtc2dfcGluZ3BvbmcuYyAgICAgICAgICAg
ICAgICAgICAgICB8IDEwMCArKysrKysrKysrKysrDQppbmNsdWRlL2xpbnV4L2lteF9ycG1zZy5o
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQzICsrKysrKw0KNiBmaWxlcyBjaGFu
Z2VkLCA3ODYgaW5zZXJ0aW9ucygrKQ0K
