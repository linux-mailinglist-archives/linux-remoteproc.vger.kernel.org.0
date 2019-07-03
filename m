Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0F55D2F8
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Jul 2019 17:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfGBPhJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 2 Jul 2019 11:37:09 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57128 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbfGBPhJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jul 2019 11:37:09 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62FWPIc013470;
        Tue, 2 Jul 2019 17:36:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Jbd+t0wU2HM6+Xf25FXBNwZBmjBxyRZNxSWnnTH3u0s=;
 b=E/hGutcFgCtg9uPTe+fiAWBKFad0wJFbqBxSibJH0QZP+QvwZkFb273qX370RVBy3598
 v/vQ2d+wza167qXi/XIalBFqmoLR1HbbwKa+oUpNCoNAuPzQhC6KvdC5TIVL8AVpKmUc
 T5FZjVJSL8Uz1/7yBy+usER3f7pr4tTVpdbWIeuTDL3qCeTa0EoS+FU2OwL1pCq+xZfa
 X8CP41MMud1MO6PjdyyFQHf2DVumI/wn7ISi+1DfaJK9OweUPtFFnV+8V9jb5VsaHkLZ
 oxDu2zWb8rrNeagPVhFnXirhtCvxzrYVc1hx50L3NuQyj3Vt5hXCMR9IVX4G/CLdWxiC zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tdxvhvybs-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:36:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5AEC38;
        Tue,  2 Jul 2019 15:36:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA717447C;
        Tue,  2 Jul 2019 15:36:56 +0000 (GMT)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG7NODE2.st.com
 (10.75.127.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 17:36:56 +0200
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Tue, 2 Jul 2019 17:36:56 +0200
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Christoph Hellwig <hch@infradead.org>,
        Clement Leger <cleger@kalray.eu>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Thread-Topic: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Thread-Index: AQHVL9sMjAFFqcSPYUOpD1xKQA9Tl6a3MSeAgAAqZ/A=
Date:   Tue, 2 Jul 2019 15:36:56 +0000
Message-ID: <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
In-Reply-To: <20190702132229.GA8100@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Christoph,

> -----Original Message-----
> From: Christoph Hellwig <hch@infradead.org>
> Sent: mardi 2 juillet 2019 15:22
> To: Clement Leger <cleger@kalray.eu>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Loic PALLARDY <loic.pallardy@st.com>
> Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
>=20
> This is just increasing the mess remoteproc has created with the vdev.
> It is poking its nose way to deep into the DMA layer internals, and
> creating massive problems that way.  Can we go back to the table
> and figure out what the root problem even was?  To me it seems if you
> clearly need separate devices they should be declared as such in the
> device tree.

Agree there is definitively an issue with the way virtio device are defined=
.
Today definition is based on rproc firmware ressource table and rproc=20
framework is in charge of vdev creation.
Device tree definition was discarded as vdev is not HW but SW definition.
One solution would be to associate both resource table (which provides
Firmware capabilities) and some virtio device tree nodes (declared as sub n=
odes
of remote processor with associated resources like memory carveout).
When we have a match between resource table and rproc DT sub node, we
can register virtio device via of_platform_populate.
Then need to adapt virtio_rpmsg or to create a virtio_rproc to be DT probe =
compliant
like virtio_mmio is.

But that's breaking legacy as all platforms will have to add a virtio devic=
e node in
their DT file...

Is it aligned with your view ?

Regards,
Loic

