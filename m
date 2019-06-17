Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F58A47F53
	for <lists+linux-remoteproc@lfdr.de>; Mon, 17 Jun 2019 12:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfFQKKm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 17 Jun 2019 06:10:42 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:9456 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726960AbfFQKKm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jun 2019 06:10:42 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HA0j5T012398;
        Mon, 17 Jun 2019 12:10:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=74uip9QMcehm5rlz5dEKVjT6BdbODCwBuEp74EqHAl8=;
 b=sI6RPsouJ9FEXhrygCotdDs/o4rmXMZbnT3dGRRumfleNOCkg0+2DoyAsUQqICDhXrZh
 +DqkWe5hNPLkj1+E9bh/w34IqNKDT2vnH2bFNZRsHQNSC0VwYVsUOkimiTCQ4u6va4Lv
 DJE6k+aiQIIDSmgvJ28Eo2NEBo/ha01lVYpeh5k8XQXuCM19fQesal250emOS7GHZH4g
 DjUC2Yx+dNrjyr6K3ghXoPRLO+4wqKZoxMd5Fv3PrHG15zH1rx1iGRFUBBkmNlkDlOdv
 bk55px0tialBrkWJ/cwu1s+/Kvo1UL9pmdm9z4ByWc9etNYLuaP9dKWOYsmLNEoxuX9L +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t68n3g2db-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 12:10:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CACEF34;
        Mon, 17 Jun 2019 10:10:37 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node3.st.com [10.75.127.21])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A56702658;
        Mon, 17 Jun 2019 10:10:37 +0000 (GMT)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG7NODE3.st.com
 (10.75.127.21) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 12:10:37 +0200
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Mon, 17 Jun 2019 12:10:37 +0200
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Thread-Topic: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Thread-Index: AQHVIQT6iw7yVu/aoE+gjo/NlBKpAKafovmw
Date:   Mon, 17 Jun 2019 10:10:37 +0000
Message-ID: <39b15f15172b4595bba43db86bc0c55e@SFHDAG7NODE2.st.com>
References: <20190612095521.4703-1-cleger@kalray.eu>
In-Reply-To: <20190612095521.4703-1-cleger@kalray.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-17_05:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Clement,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Clement Leger
> Sent: mercredi 12 juin 2019 11:55
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; linux-remoteproc <linux-
> remoteproc@vger.kernel.org>
> Cc: Clement Leger <cleger@kalray.eu>
> Subject: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
>=20
> When preparing the subdevice for the vdev, also copy dma_pfn_offset
> since this is used for sub device dma allocations. Without that, there
> is incoherency between the parent dma settings and the childs one,
> potentially leading to dma_alloc_coherent failure (due to phys_to_dma
> using dma_pfn_offset for translation).

Thanks for this correction.
Could you please add fixes in message commit
Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma m=
emory pool")

Else
Acked-by: Loic Pallardy <loic.pallardy@st.com>

Regards,
Loic

> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 263e9c9614a8..3b56ca043231 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent =3D rproc->dev.parent;
> +	rvdev->dev.dma_pfn_offset =3D rproc->dev.parent->dma_pfn_offset;
>  	rvdev->dev.release =3D rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev-
> >dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> --
> 2.15.0.276.g89ea799

