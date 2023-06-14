Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CAD72F89D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Jun 2023 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243254AbjFNJDm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 14 Jun 2023 05:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242916AbjFNJDj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Jun 2023 05:03:39 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B455F10E9;
        Wed, 14 Jun 2023 02:03:33 -0700 (PDT)
X-UUID: 5540747a0a8b11eeb20a276fd37b9834-20230614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OzMSF4O6EESR3IMCGvwhXUOURx3RvD6Hme0bWb0qP84=;
        b=lQb58285vgDofBcu1fur9cEgX2jur513CXhDNVVChO9yCK/oKJo/Zn5FbnkaiZvL0uSD87wNLWf9wxAfNPX2LpHftTQ1rQrtLPtscjXNWpKA2jZg7U2RmxAKC20gLSxAqW5qeI3U4s+ABqX/ax8/eazDXYkwB+vP8uR9sXOfW1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:4957abcd-70d4-4b8b-a104-2990d4ce4c6f,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:45
X-CID-INFO: VERSION:1.1.26,REQID:4957abcd-70d4-4b8b-a104-2990d4ce4c6f,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:45
X-CID-META: VersionHash:cb9a4e1,CLOUDID:98cc633e-de1e-4348-bc35-c96f92f1dcbb,B
        ulkID:230614161324K9LJRXVL,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|102,
        TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
        0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: 5540747a0a8b11eeb20a276fd37b9834-20230614
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 22388509; Wed, 14 Jun 2023 16:13:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 16:13:22 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 14 Jun 2023 16:13:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpvDgeRcjga/XBCa/XlwdEgCrGHAKvA35CAgnZHeQIuyMR+hOFz3Y1WcoO5aTkJfhWfb/at0PIRldjYdEpTDTrxqUpf3YcR6hPD9luk8oUJdR0E90JZAD72yYVuWJafLPQRj2jwnNfKprMBpbi3Rl2oxAuvda2E5BZvT80us03T19S2kIrjAjSAuVwT9aDncvEpl4qm9/qxpPKsml5e4sxYRC2O+4dK/O/KQkZI/PqP4qE27YpNAtsivAUC3BszUTbBaX8EloJ4YAKZmHqr5RUexBRI5utpdIT7AQAbK5/66K9rSektKFCI06dtYiG8qY2CgG7BZBYhNYqdgzljR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzMSF4O6EESR3IMCGvwhXUOURx3RvD6Hme0bWb0qP84=;
 b=myUrT1KWHdlCxKyDWbiWH4Zlt73WA5y3cj2S81ihTKkH0FWkyLjAeyGKvidN2Anzmf+AL31vXbXl+f8nmT+0MfXgv0uvoDeDU1LZs/9ssm2kYsJt50WyFtKDAvlLRVc3zCfV9F9V+RKweYJsIWwDxyhX+G/6G6fyxCPjClxUtEFxHEn47v++73T/xXUdZN5HEeEgiflqHM32QkZgXML81r/JPLtV7+KNsf0TZbeDtj0+GrstDoWp4VUoVwoiWfR9x2ZnCRzX2umUCE4MFsZF9dRbfGDh1Be7JR1SPMHNWKkl5rqQQHnuVSDqwMcgUc6o+f3emiODjc3gROTXNeLQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzMSF4O6EESR3IMCGvwhXUOURx3RvD6Hme0bWb0qP84=;
 b=gsMFIXcFGLo4lNqU1mzVE4zfKbKCiCl4FBL9HRDyAKQnkf4A3C04GxydVcc8sXULiw1zynqdlFhNUgGpvt3vYC0xNjlVafOxyWVIy84gsm2/OjDdx97sCTU1ssYopPJ5Jr780KbTXJgrEroczBwQYv5VQ5VgRXNu2HFg1KIywbY=
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com (2603:1096:100:53::15)
 by SEYPR03MB7009.apcprd03.prod.outlook.com (2603:1096:101:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 08:13:18 +0000
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::2648:bb51:77fb:125b]) by SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::2648:bb51:77fb:125b%4]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 08:13:18 +0000
From:   =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= 
        <TingHan.Shen@mediatek.com>
To:     "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v13 05/11] remoteproc: mediatek: Introduce cluster on
 single-core SCP
Thread-Topic: [PATCH v13 05/11] remoteproc: mediatek: Introduce cluster on
 single-core SCP
Thread-Index: AQHZmREWM9sf5lt/10GGmQUprBIKY6+Hc7YAgAKKTYA=
Date:   Wed, 14 Jun 2023 08:13:18 +0000
Message-ID: <0668bbfc732db80ad12703c1c4906cb4348b5730.camel@mediatek.com>
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
         <20230607072222.8628-6-tinghan.shen@mediatek.com> <ZIdVGoeMH91kamAI@p14s>
In-Reply-To: <ZIdVGoeMH91kamAI@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4204:EE_|SEYPR03MB7009:EE_
x-ms-office365-filtering-correlation-id: be79dcbc-1dd6-41e3-c268-08db6caf35f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7RvWkBIs1eid4pn/53qgkhGrR4bgS4hN4kw6fnHPwaSvJC03VD46Z7+V6Ch6mWjMW11Ambb7stNIiOieAFPaKlaPTuGcYoU9VZk7f2srvVOkt+Mqaf/yvZ+MkxTACvWe3UY+6sSNSgdczuhaLU+uBgKHASqR3H9hHhA/UINNRZY3+mu/q+PdB3f2l+iqwSIZxMBHKWuuIOaKhwkn+lDEkzSCTFkoeTcJHGcN4vl+1H/HGLnJtF3FvbK58oLOkhKngKJOrq6PKAsoVUOSckWeiQQfCOFFtNKK2B+/vKp2FmMVNma6Mvxm6OQcqXyBTnaqZrm+2KieVdO58cdlnEmfEOCI1jKjaN8OTzbkZR0YWqFBDiAsUJdCG1He1BL57918FtJbqcYbXjLhgb46u3WXkPdha+5GoVFtXARJtOJRAyp1yRL+jrbF9//MtxVbuq8VmkL/wsCubZmfX+2fMLHk0wlYTY60uHg+B8N8R4YnnYRNFEZfnWayf6b1gVRflEgtyedo+4aXG5aiuUnEHMkW/52qESRUMVT0Ol5vrsSVMcUGruWT74HO0IM8ABssZG/o0rxZAm2m0h/l0GZQsNUxuQEhPVwQ7dS1mW1Pg51z5AOU266Q8k90RyKIn1gS7ciZOQRjClMr5cOtO7MVtAHX5AG96aZrKwVdOqIi7i2qmIJt86fgORaqgKZ+7QaYPIrq4BFhg1QIVgd5VmU4jF3toA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4204.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(38100700002)(478600001)(85182001)(36756003)(86362001)(71200400001)(66946007)(6916009)(66476007)(4326008)(91956017)(76116006)(64756008)(66446008)(66556008)(316002)(122000001)(38070700005)(54906003)(6506007)(5660300002)(83380400001)(186003)(2616005)(7416002)(2906002)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnMxSGlMY2ttM3l4aDUxOXBVRUpTQ3hYdVhCTmF1MThPNGErNlVVeFh3OHdZ?=
 =?utf-8?B?clV1cTFuNklOblQ5cVRCV2pPVm1Jc1RnSVl0R0FIbmx0blZIVnYxeWJZcFRr?=
 =?utf-8?B?dGUxZE9leXAwY2NaS3F1RXhYdEpKNEI2RnZQaGNtY09CbFZUTW5Gd2FzQTlR?=
 =?utf-8?B?S2ZRc1E0MGplenNicXBDWGJHVTFLeUJnMlp4SHFFREdvZ1F0b2IzSnFnQTY4?=
 =?utf-8?B?R1IxN1UxZTI2WithQi9OWlcvSEpDOTJ2aWp2WXdwSm80ZmhVMHdNRkprdHlB?=
 =?utf-8?B?YllJUmFqMlk4eXdpcFE2QnNkNWdXSS94NURIVlZveVN1WWFSUWlGazQ0T3RT?=
 =?utf-8?B?WTk1S0p3RzFPaWVLaU5henpWQnUyYjN5eFcxNWludlBWUDFyQW56WUlmUUFm?=
 =?utf-8?B?MWhsRm83Qm1VMGRCUmNyYzU1TVRYdzNGUU5mRFJIb3ArMTNhcHV3ZU9JaTNp?=
 =?utf-8?B?L0VPUmlGbmg0cVA3RG5mdk16RFNsbVBmcytOYXZTczM0OFplVndnY2lMRUVP?=
 =?utf-8?B?d0pIR0dvNjhiYklSeTh4c212U2cvUUtxR0k4TmNpb0Jpd05Zd254MGVSdk1W?=
 =?utf-8?B?Z09KRXI1QnRIeXVKMTcrRlV6MVR6REJmd25qWDA5d0M3SnNLSitTdHI1ZGNC?=
 =?utf-8?B?L0RPVUNOZVpRYTBxbHBGL1kzV2xqTWlQS1E2SXNvMjdFTWs4Q1BrSVIzaXh4?=
 =?utf-8?B?c0VWYjgxc1hWelJoa3pWbXJKRzRKNFZwbGt1bHFaQW1pZm4zbU5CTXd4a2Rs?=
 =?utf-8?B?MXdjWEVQVlBEZGN1dFRyY3Nwa3Z5OHU4L0w5NVlZRGlGSWc3ZUhVWDVLZUJO?=
 =?utf-8?B?ZHpCcUFIQ0RkeGZidERVcTdielhoODJMQ3puRkhlZWQ1RTBSQUZRcnEwVEtq?=
 =?utf-8?B?UGcyeEVyM0RmcFBsSi9ERG9BV1h0bVJFZlkxZzUvTmdJRUxDS1hxZzVrSE0x?=
 =?utf-8?B?QzlsMDQrNHlQYkR3Y3NReHQ5MjlLYitEbWpjT2lrUGNHSlcrdzk1bjBUeU8w?=
 =?utf-8?B?djdMdnlkMW0xdTdNVFJqUld5dGZMUmdySTRtM0VyUHRWaHlOemduOCswRWVW?=
 =?utf-8?B?c2krdmk0RHBmQmtQMnhEU1g4Rk1ya3FIZkFTWXFhaWlVSEk4R2RadUY3Y2cx?=
 =?utf-8?B?ZnlERk80VHRlcnpFaHlhbE9mVk5aVm9GSUdMUzJkWE9rZ1V5RCtZVGt5WjBo?=
 =?utf-8?B?cy9ZN2J5bkV5aG1xUTNXTHRYMFBRUVdud2hVTi9zMzRnYlAwbXlEa2xWNmhh?=
 =?utf-8?B?cG12V0VqcmtwUzF3T1NrbzRVWVZKR3VlVjE3NVIvMDJlNW1iNGdIbW9Jd0VP?=
 =?utf-8?B?QTZhckVML2MwWVZqZzN5UnVWb0o4djIvbDVuUWU5QU5pSHoyNGFNL0RpSFo1?=
 =?utf-8?B?VFo5VzRUazNGWUVMSGlZQXdSNm9aSWhZQTNXSDNIYzA3dkdvUWdvYXd3clhS?=
 =?utf-8?B?QW5kZkI0TisxbWdkOVlYUU13c0huNUJzTTN4cWpiTHFZTjFkK0hBSFA3U2pi?=
 =?utf-8?B?c3BhUmxieVcweUlSVnVZZlIrNFRFajhaNFBwUUdqRTIvMUZMeFIwWmQyU08v?=
 =?utf-8?B?SWFYT3RVOGF0VFFyZkZJNHFNNko3QkJNWU5ma1dhb3ZvSjVxK25WQzBzWE9U?=
 =?utf-8?B?K2JmcTRuVTZBNzFUT0RnSS9GY3ljUkJnbnlObU1sNnA4ejdUN1FCeHFRdVFl?=
 =?utf-8?B?VmlIYVk4TGNnWWlFclBuVzh0V2dpd3hqRU4zTndabmU0b0ZQVXN0RnVqSEgw?=
 =?utf-8?B?ZndWVEM2ektySkIrQmFkVHJFOVhxUWJnR0ZzNXNZSWg1RjR1L3pXL3NuVzRv?=
 =?utf-8?B?SjlrTUxXVUtONHc5Q3VxZURNbU44RGRVSUxpTXB3MzYyS3FDWWNJZjlPZmg0?=
 =?utf-8?B?MlU2L0dGV3FNVXZmYk5WNEFDTW01L05RRXAxOXhmdkZ0OTBMUHVpTWZlTHpM?=
 =?utf-8?B?YWtCMFZWSElIRmYvcFh2TmM4RmkzUDdHQmwrajhkZWxTbUl0c0diRldpTE5O?=
 =?utf-8?B?TG5WRWlXRlpxTWgrMHljb3VoSzlVcXVkY21COXRoVmJsa2hoUFB4Ym1FS2M2?=
 =?utf-8?B?QmErV01ibGpuaHlGd01PajNvaVdFTGlQRy8wM01JaVR4NHJHbHdRVU5lcVdx?=
 =?utf-8?B?VzFzaUNBR292Y1ZMUnBMMEdFNXFTMGZ5Zm1OdTRQam41NmViTDJtLzhsMXl6?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F0AA69DFE0A5E429ABA2A89F67C9368@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4204.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be79dcbc-1dd6-41e3-c268-08db6caf35f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 08:13:18.3110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdUCp+ufE5/prPXD4q/t+yYr3i6qzT3RStwO0WE8jJS2lJxZki/Ukwyurwf4/FD4zsRpUU+f3E9tHl476gU1b1EyFoV0FXc8FAmFcPfNego=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7009
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgTWF0aGlldSwNCg0KT24gTW9uLCAyMDIzLTA2LTEyIGF0IDExOjI1IC0wNjAwLCBNYXRoaWV1
IFBvaXJpZXIgd3JvdGU6DQo+IE9uIFdlZCwgSnVuIDA3LCAyMDIzIGF0IDAzOjIyOjE2UE0gKzA4
MDAsIFRpbmdoYW4gU2hlbiB3cm90ZToNCj4gPiBUaGlzIGlzIHRoZSBwcmVsaW1pbmFyeSBzdGVw
IGZvciBwcm9iaW5nIG11bHRpLWNvcmUgU0NQLg0KPiA+IFRoZSBpbml0aWFsaXphdGlvbiBwcm9j
ZWR1cmUgZm9yIHJlbW90ZXByb2MgaXMgc2ltaWxhciBmb3IgYm90aA0KPiA+IHNpbmdsZS1jb3Jl
IGFuZCBtdWx0aS1jb3JlIGFyY2hpdGVjdHVyZXMgYW5kIGlzIHJldXNpbmcgdG8gYXZvaWQNCj4g
PiByZWR1bmRhbnQgY29kZS4NCj4gPiANCj4gPiBSZXdyaXRlIHRoZSBwcm9iaW5nIGZsb3cgb2Yg
c2luZ2xlLWNvcmUgU0NQIHRvIGFkYXB0IHdpdGggdGhlICdjbHVzdGVyJw0KPiA+IGNvbmNlcHQg
bmVlZGVkIGJ5IHByb2JpbmcgdGhlIG11bHRpLWNvcmUgU0NQLiBUaGUgbWFpbiBkaWZmZXJlbmNl
cw0KPiA+IGFyZSwNCj4gPiAtIHRoZSBTQ1AgY29yZSBvYmplY3QocykgaXMgbWFpbnRhaW5lZCBh
dCB0aGUgY2x1c3RlciBsaXN0IGluc3RlYWQgb2YgYXQNCj4gPiAgIHRoZSBwbGF0b2ZtciBkZXZp
Y2UgZHJpdmVyIGRhdGEgcHJvcGVydHkuDQo+ID4gLSBzYXZlIHRoZSBjbHVzdGVyIGluZm9ybWF0
aW9uIGF0IHRoZSBwbGF0b2ZtciBkZXZpY2UgZHJpdmVyIGRhdGEgcHJvcGVydHkuDQo+ID4gLSBJ
biBvcmRlciB0byBrZWVwIHRoZSBjb21wYXRpYmlsaXR5IG9mIGV4cG9ydGVkIFNDUCBBUElzIHdo
aWNoIGdldHRpbmcNCj4gPiAgIHRoZSBTQ1AgY29yZSBvYmplY3QgYnkgU0NQIG5vZGUgcGhhbmRs
ZSwgbW92ZSB0aGUgU0NQIGNvcmUgb2JqZWN0DQo+ID4gICBwb2ludGVycyB0byB0aGUgcGxhdGZv
cm0gZGV2aWNlIHBsYXRmb3JtIGRhdGEgcHJvcGVydHkuDQo+ID4gDQo+ID4gVGhlIHJlZ2lzdGVy
cyBvZiBjb25maWcgYW5kIGwxdGNtIGFyZSBzaGFyZWQgZm9yIG11bHRpLWNvcmUNCj4gPiBTQ1Au
IFJldXNlIHRoZSBtYXBwZWQgYWRkcmVzc2VzIGZvciBhbGwgY29yZXMuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogVGluZ2hhbiBTaGVuIDx0aW5naGFuLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvbXRrX2NvbW1vbi5oIHwgICAyICsNCj4gPiAg
ZHJpdmVycy9yZW1vdGVwcm9jL210a19zY3AuYyAgICB8IDE1MSArKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCA0
MSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVwcm9j
L210a19jb21tb24uaCBiL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfY29tbW9uLmgNCj4gPiBpbmRl
eCBjMDkwNWFlYzNiNGIuLjU2Mzk1ZTg2NjRjYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Jl
bW90ZXByb2MvbXRrX2NvbW1vbi5oDQo+ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL210a19j
b21tb24uaA0KPiA+IEBAIC0xMjgsNiArMTI4LDggQEAgc3RydWN0IG10a19zY3Agew0KPiA+ICAJ
c2l6ZV90IGRyYW1fc2l6ZTsNCj4gPiAgDQo+ID4gIAlzdHJ1Y3QgcnByb2Nfc3ViZGV2ICpycG1z
Z19zdWJkZXY7DQo+ID4gKw0KPiA+ICsJc3RydWN0IGxpc3RfaGVhZCBlbGVtOw0KPiA+ICB9Ow0K
PiA+ICANCj4gPiAgLyoqDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtf
c2NwLmMgYi9kcml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jDQo+ID4gaW5kZXggZDY2ODIyZGFk
OTQzLi5jOGZjNmI0NmY4MmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL210
a19zY3AuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMNCj4gPiBAQCAt
MjMsNiArMjMsMTQgQEANCj4gPiAgI2RlZmluZSBNQVhfQ09ERV9TSVpFIDB4NTAwMDAwDQo+ID4g
ICNkZWZpbmUgU0VDVElPTl9OQU1FX0lQSV9CVUZGRVIgIi5pcGlfYnVmZmVyIg0KPiA+ICANCj4g
PiArc3RydWN0IG10a19zY3Bfb2ZfY2x1c3RlciB7DQo+ID4gKwl2b2lkIF9faW9tZW0gKnJlZ19i
YXNlOw0KPiA+ICsJdm9pZCBfX2lvbWVtICpsMXRjbV9iYXNlOw0KPiA+ICsJc2l6ZV90IGwxdGNt
X3NpemU7DQo+ID4gKwlwaHlzX2FkZHJfdCBsMXRjbV9waHlzOw0KPiA+ICsJc3RydWN0IGxpc3Rf
aGVhZCBtdGtfc2NwX2xpc3Q7DQo+ID4gK307DQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogc2Nw
X2dldCgpIC0gZ2V0IGEgcmVmZXJlbmNlIHRvIFNDUC4NCj4gPiAgICoNCj4gPiBAQCAtNTEsNyAr
NTksNyBAQCBzdHJ1Y3QgbXRrX3NjcCAqc2NwX2dldChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICAJCXJldHVybiBOVUxMOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCXJldHVybiBw
bGF0Zm9ybV9nZXRfZHJ2ZGF0YShzY3BfcGRldik7DQo+ID4gKwlyZXR1cm4gKihzdHJ1Y3QgbXRr
X3NjcCAqKilkZXZfZ2V0X3BsYXRkYXRhKCZzY3BfcGRldi0+ZGV2KTsNCj4gPiAgfQ0KPiA+ICBF
WFBPUlRfU1lNQk9MX0dQTChzY3BfZ2V0KTsNCj4gPiAgDQo+ID4gQEAgLTgxMCwxNCArODE4LDE0
IEBAIHN0YXRpYyB2b2lkIHNjcF91bm1hcF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBtdGtfc2NwICpz
Y3ApDQo+ID4gIHN0YXRpYyBpbnQgc2NwX3JlZ2lzdGVyX2lwaShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LCB1MzIgaWQsDQo+ID4gIAkJCSAgICBpcGlfaGFuZGxlcl90IGhhbmRsZXIsIHZv
aWQgKnByaXYpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBtdGtfc2NwICpzY3AgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXN0cnVjdCBtdGtfc2NwICpzY3AgPSAqKHN0cnVjdCBt
dGtfc2NwICoqKWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7DQo+ID4gIA0KPiA+ICAJcmV0
dXJuIHNjcF9pcGlfcmVnaXN0ZXIoc2NwLCBpZCwgaGFuZGxlciwgcHJpdik7DQo+ID4gIH0NCj4g
PiAgDQo+ID4gIHN0YXRpYyB2b2lkIHNjcF91bnJlZ2lzdGVyX2lwaShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LCB1MzIgaWQpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBtdGtfc2NwICpzY3Ag
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXN0cnVjdCBtdGtfc2NwICpzY3Ag
PSAqKHN0cnVjdCBtdGtfc2NwICoqKWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7DQo+ID4g
IA0KPiA+ICAJc2NwX2lwaV91bnJlZ2lzdGVyKHNjcCwgaWQpOw0KPiA+ICB9DQo+ID4gQEAgLTgy
NSw3ICs4MzMsNyBAQCBzdGF0aWMgdm9pZCBzY3BfdW5yZWdpc3Rlcl9pcGkoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiwgdTMyIGlkKQ0KPiA+ICBzdGF0aWMgaW50IHNjcF9zZW5kX2lwaShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB1MzIgaWQsIHZvaWQgKmJ1ZiwNCj4gPiAgCQkJ
dW5zaWduZWQgaW50IGxlbiwgdW5zaWduZWQgaW50IHdhaXQpDQo+ID4gIHsNCj4gPiAtCXN0cnVj
dCBtdGtfc2NwICpzY3AgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXN0cnVj
dCBtdGtfc2NwICpzY3AgPSAqKHN0cnVjdCBtdGtfc2NwICoqKWRldl9nZXRfcGxhdGRhdGEoJnBk
ZXYtPmRldik7DQo+ID4gIA0KPiA+ICAJcmV0dXJuIHNjcF9pcGlfc2VuZChzY3AsIGlkLCBidWYs
IGxlbiwgd2FpdCk7DQo+ID4gIH0NCj4gPiBAQCAtODU1LDcgKzg2Myw4IEBAIHN0YXRpYyB2b2lk
IHNjcF9yZW1vdmVfcnBtc2dfc3ViZGV2KHN0cnVjdCBtdGtfc2NwICpzY3ApDQo+ID4gIAl9DQo+
ID4gIH0NCj4gPiAgDQo+ID4gLXN0YXRpYyBpbnQgc2NwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgbXRrX3NjcCAqc2NwX3Jwcm9jX2luaXQo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiArCQkJCSAgICAgIHN0cnVjdCBtdGtf
c2NwX29mX2NsdXN0ZXIgKnNjcF9jbHVzdGVyKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+
b2Zfbm9kZTsNCj4gPiBAQCAtODY3LDUyICs4NzYsNDIgQEAgc3RhdGljIGludCBzY3BfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgDQo+ID4gIAlyZXQgPSBycHJvY19v
Zl9wYXJzZV9maXJtd2FyZShkZXYsIDAsICZmd19uYW1lKTsNCj4gPiAgCWlmIChyZXQgPCAwICYm
IHJldCAhPSAtRUlOVkFMKQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsNCj4gPiAgDQo+ID4gIAlycHJvYyA9IGRldm1fcnByb2NfYWxsb2MoZGV2LCBucC0+
bmFtZSwgJnNjcF9vcHMsIGZ3X25hbWUsIHNpemVvZigqc2NwKSk7DQo+ID4gLQlpZiAoIXJwcm9j
KQ0KPiA+IC0JCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT01FTSwgInVuYWJsZSB0byBh
bGxvY2F0ZSByZW1vdGVwcm9jXG4iKTsNCj4gPiArCWlmICghcnByb2MpIHsNCj4gPiArCQlkZXZf
ZXJyKGRldiwgInVuYWJsZSB0byBhbGxvY2F0ZSByZW1vdGVwcm9jXG4iKTsNCj4gPiArCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gPiArCX0NCj4gPiAgDQo+ID4gIAlzY3AgPSBycHJvYy0+
cHJpdjsNCj4gPiAgCXNjcC0+cnByb2MgPSBycHJvYzsNCj4gPiAgCXNjcC0+ZGV2ID0gZGV2Ow0K
PiA+ICAJc2NwLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ID4gLQlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBzY3ApOw0KPiA+ICsJcGxhdGZvcm1fZGV2aWNlX2Fk
ZF9kYXRhKHBkZXYsICZzY3AsIHNpemVvZihzY3ApKTsNCj4gPiArDQo+ID4gKwlzY3AtPnJlZ19i
YXNlID0gc2NwX2NsdXN0ZXItPnJlZ19iYXNlOw0KPiA+ICsJc2NwLT5sMXRjbV9iYXNlID0gc2Nw
X2NsdXN0ZXItPmwxdGNtX2Jhc2U7DQo+ID4gKwlzY3AtPmwxdGNtX3NpemUgPSBzY3BfY2x1c3Rl
ci0+bDF0Y21fc2l6ZTsNCj4gPiArCXNjcC0+bDF0Y21fcGh5cyA9IHNjcF9jbHVzdGVyLT5sMXRj
bV9waHlzOw0KPiA+ICANCj4gPiAgCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUo
cGRldiwgSU9SRVNPVVJDRV9NRU0sICJzcmFtIik7DQo+ID4gIAlzY3AtPnNyYW1fYmFzZSA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ID4gLQlpZiAoSVNfRVJSKHNjcC0+c3Jh
bV9iYXNlKSkNCj4gPiAtCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc2NwLT5z
cmFtX2Jhc2UpLA0KPiA+IC0JCQkJICAgICAiRmFpbGVkIHRvIHBhcnNlIGFuZCBtYXAgc3JhbSBt
ZW1vcnlcbiIpOw0KPiA+ICsJaWYgKElTX0VSUihzY3AtPnNyYW1fYmFzZSkpIHsNCj4gPiArCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBwYXJzZSBhbmQgbWFwIHNyYW0gbWVtb3J5XG4iKTsNCj4g
PiArCQlyZXR1cm4gRVJSX1BUUihQVFJfRVJSKHNjcC0+c3JhbV9iYXNlKSk7DQo+IA0KPiBDYW4g
eW91IHNwb3Qgd2hhdCBpcyB3cm9uZyBoZXJlPw0KDQpBZnRlciBsb29rIGFyb3VuZCBvZiB0aGUg
aGVhZGVyLCBJIHRob3VnaHQgdGhhdCBJIHNob3VsZCB1c2UgdGhlIEVSUl9DQVNUIGluc3RlYWQu
DQpJdCBmaXggdGhlIHNwYXJzZSB3YXJuaW5nIGFuZCBwcmV2ZW50IHRoZSB3ZWlyZWQgZG91Ymxl
IHR5cGUgY2FzdGluZy4NCklmIHRoaXMgaXMgb2ssIEkgd2lsbCBmaXggaXQgdGhpcyB3YXkgaW4g
dGhlIG5leHQgdmVyc2lvbi4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpUaW5nSGFuDQoNCj4gDQo+ID4g
Kwl9DQo+ID4gIA0KPiA+ICAJc2NwLT5zcmFtX3NpemUgPSByZXNvdXJjZV9zaXplKHJlcyk7DQo+
ID4gIAlzY3AtPnNyYW1fcGh5cyA9IHJlcy0+c3RhcnQ7DQo+ID4gIA0KPiA+IC0JLyogbDF0Y20g
aXMgYW4gb3B0aW9uYWwgbWVtb3J5IHJlZ2lvbiAqLw0KPiA+IC0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImwxdGNtIik7DQo+ID4gLQlz
Y3AtPmwxdGNtX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiA+IC0J
aWYgKElTX0VSUihzY3AtPmwxdGNtX2Jhc2UpKSB7DQo+ID4gLQkJcmV0ID0gUFRSX0VSUihzY3At
PmwxdGNtX2Jhc2UpOw0KPiA+IC0JCWlmIChyZXQgIT0gLUVJTlZBTCkgew0KPiA+IC0JCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBtYXAgbDF0Y20gbWVtb3J5XG4i
KTsNCj4gPiAtCQl9DQo+ID4gLQl9IGVsc2Ugew0KPiA+IC0JCXNjcC0+bDF0Y21fc2l6ZSA9IHJl
c291cmNlX3NpemUocmVzKTsNCj4gPiAtCQlzY3AtPmwxdGNtX3BoeXMgPSByZXMtPnN0YXJ0Ow0K
PiA+IC0JfQ0KPiA+IC0NCj4gPiAtCXNjcC0+cmVnX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVt
YXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJjZmciKTsNCj4gPiAtCWlmIChJU19FUlIoc2NwLT5y
ZWdfYmFzZSkpDQo+ID4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHNjcC0+
cmVnX2Jhc2UpLA0KPiA+IC0JCQkJICAgICAiRmFpbGVkIHRvIHBhcnNlIGFuZCBtYXAgY2ZnIG1l
bW9yeVxuIik7DQo+ID4gLQ0KPiA+ICAJcmV0ID0gc2NwLT5kYXRhLT5zY3BfY2xrX2dldChzY3Ap
Ow0KPiA+ICAJaWYgKHJldCkNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCXJldHVybiBFUlJf
UFRSKHJldCk7DQo+ID4gIA0KPiA+ICAJcmV0ID0gc2NwX21hcF9tZW1vcnlfcmVnaW9uKHNjcCk7
DQo+ID4gIAlpZiAocmV0KQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsNCj4gPiAgDQo+ID4gIAltdXRleF9pbml0KCZzY3AtPnNlbmRfbG9jayk7DQo+ID4g
IAlmb3IgKGkgPSAwOyBpIDwgU0NQX0lQSV9NQVg7IGkrKykNCj4gPiBAQCAtOTM5LDExICs5Mzgs
NyBAQCBzdGF0aWMgaW50IHNjcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiA+ICAJCWdvdG8gcmVtb3ZlX3N1YmRldjsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQlyZXQgPSBy
cHJvY19hZGQocnByb2MpOw0KPiA+IC0JaWYgKHJldCkNCj4gPiAtCQlnb3RvIHJlbW92ZV9zdWJk
ZXY7DQo+ID4gLQ0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gKwlyZXR1cm4gc2NwOw0KPiA+ICANCj4g
PiAgcmVtb3ZlX3N1YmRldjoNCj4gPiAgCXNjcF9yZW1vdmVfcnBtc2dfc3ViZGV2KHNjcCk7DQo+
ID4gQEAgLTk1NCwxNSArOTQ5LDEzIEBAIHN0YXRpYyBpbnQgc2NwX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAkJbXV0ZXhfZGVzdHJveSgmc2NwLT5pcGlfZGVzY1tp
XS5sb2NrKTsNCj4gPiAgCW11dGV4X2Rlc3Ryb3koJnNjcC0+c2VuZF9sb2NrKTsNCj4gPiAgDQo+
ID4gLQlyZXR1cm4gcmV0Ow0KPiA+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gPiAgfQ0KPiA+
ICANCj4gPiAtc3RhdGljIHZvaWQgc2NwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICtzdGF0aWMgdm9pZCBzY3BfZnJlZShzdHJ1Y3QgbXRrX3NjcCAqc2NwKQ0KPiA+
ICB7DQo+ID4gLQlzdHJ1Y3QgbXRrX3NjcCAqc2NwID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7DQo+ID4gIAlpbnQgaTsNCj4gPiAgDQo+ID4gLQlycHJvY19kZWwoc2NwLT5ycHJvYyk7DQo+
ID4gIAlzY3BfcmVtb3ZlX3JwbXNnX3N1YmRldihzY3ApOw0KPiA+ICAJc2NwX2lwaV91bnJlZ2lz
dGVyKHNjcCwgU0NQX0lQSV9JTklUKTsNCj4gPiAgCXNjcF91bm1hcF9tZW1vcnlfcmVnaW9uKHNj
cCk7DQo+ID4gQEAgLTk3MSw2ICs5NjQsODIgQEAgc3RhdGljIHZvaWQgc2NwX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJbXV0ZXhfZGVzdHJveSgmc2NwLT5zZW5k
X2xvY2spOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMgaW50IHNjcF9jbHVzdGVyX2luaXQo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19z
Y3Bfb2ZfY2x1c3RlciAqc2NwX2NsdXN0ZXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsN
Cj4gPiArCXN0cnVjdCBsaXN0X2hlYWQgKmNsdXN0ZXIgPSAmc2NwX2NsdXN0ZXItPm10a19zY3Bf
bGlzdDsNCj4gPiArCXN0cnVjdCBtdGtfc2NwICpzY3A7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArCXNjcCA9IHNjcF9ycHJvY19pbml0KHBkZXYsIHNjcF9jbHVzdGVyKTsNCj4gPiArCWlm
IChJU19FUlIoc2NwKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihzY3ApOw0KPiA+ICsNCj4gPiAr
CXJldCA9IHJwcm9jX2FkZChzY3AtPnJwcm9jKTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgcnByb2NcbiIpOw0KPiA+ICsJCXNjcF9mcmVlKHNj
cCk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlsaXN0X2FkZF90
YWlsKCZzY3AtPmVsZW0sIGNsdXN0ZXIpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHNjcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0K
PiA+ICsJc3RydWN0IG10a19zY3Bfb2ZfY2x1c3RlciAqc2NwX2NsdXN0ZXI7DQo+ID4gKwlzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJc2NwX2NsdXN0
ZXIgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnNjcF9jbHVzdGVyKSwgR0ZQX0tFUk5FTCk7
DQo+ID4gKwlpZiAoIXNjcF9jbHVzdGVyKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsN
Cj4gPiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJD
RV9NRU0sICJjZmciKTsNCj4gPiArCXNjcF9jbHVzdGVyLT5yZWdfYmFzZSA9IGRldm1faW9yZW1h
cF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ID4gKwlpZiAoSVNfRVJSKHNjcF9jbHVzdGVyLT5yZWdf
YmFzZSkpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHNjcF9jbHVz
dGVyLT5yZWdfYmFzZSksDQo+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8gcGFyc2UgYW5kIG1hcCBj
ZmcgbWVtb3J5XG4iKTsNCj4gPiArDQo+ID4gKwkvKiBsMXRjbSBpcyBhbiBvcHRpb25hbCBtZW1v
cnkgcmVnaW9uICovDQo+ID4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBk
ZXYsIElPUkVTT1VSQ0VfTUVNLCAibDF0Y20iKTsNCj4gPiArCXNjcF9jbHVzdGVyLT5sMXRjbV9i
YXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCj4gPiArCWlmIChJU19FUlIo
c2NwX2NsdXN0ZXItPmwxdGNtX2Jhc2UpKSB7DQo+ID4gKwkJcmV0ID0gUFRSX0VSUihzY3BfY2x1
c3Rlci0+bDF0Y21fYmFzZSk7DQo+ID4gKwkJaWYgKHJldCAhPSAtRUlOVkFMKQ0KPiA+ICsJCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBtYXAgbDF0Y20gbWVtb3J5
XG4iKTsNCj4gPiArDQo+ID4gKwkJc2NwX2NsdXN0ZXItPmwxdGNtX2Jhc2UgPSBOVUxMOw0KPiA+
ICsJfSBlbHNlIHsNCj4gPiArCQlzY3BfY2x1c3Rlci0+bDF0Y21fc2l6ZSA9IHJlc291cmNlX3Np
emUocmVzKTsNCj4gPiArCQlzY3BfY2x1c3Rlci0+bDF0Y21fcGh5cyA9IHJlcy0+c3RhcnQ7DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJSU5JVF9MSVNUX0hFQUQoJnNjcF9jbHVzdGVyLT5tdGtfc2Nw
X2xpc3QpOw0KPiA+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc2NwX2NsdXN0ZXIpOw0K
PiA+ICsNCj4gPiArCXJldCA9IHNjcF9jbHVzdGVyX2luaXQocGRldik7DQo+ID4gKwlpZiAocmV0
KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyB2b2lkIHNjcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19zY3Bfb2ZfY2x1c3RlciAqc2NwX2NsdXN0
ZXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArCXN0cnVjdCBtdGtfc2NwICpz
Y3AsICp0ZW1wOw0KPiA+ICsNCj4gPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZV9yZXZlcnNl
KHNjcCwgdGVtcCwgJnNjcF9jbHVzdGVyLT5tdGtfc2NwX2xpc3QsIGVsZW0pIHsNCj4gPiArCQls
aXN0X2RlbCgmc2NwLT5lbGVtKTsNCj4gPiArCQlycHJvY19kZWwoc2NwLT5ycHJvYyk7DQo+ID4g
KwkJc2NwX2ZyZWUoc2NwKTsNCj4gPiArCX0NCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfc2NwX29mX2RhdGEgbXQ4MTgzX29mX2RhdGEgPSB7DQo+ID4gIAkuc2Nw
X2Nsa19nZXQgPSBtdDgxODNfc2NwX2Nsa19nZXQsDQo+ID4gIAkuc2NwX2JlZm9yZV9sb2FkID0g
bXQ4MTgzX3NjcF9iZWZvcmVfbG9hZCwNCj4gPiAtLSANCj4gPiAyLjE4LjANCg0KDQo=
