Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3212319560A
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 12:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgC0LKb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 07:10:31 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47237 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbgC0LKb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 07:10:31 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RB3Zp5016449;
        Fri, 27 Mar 2020 12:10:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tlxaTqnJ8WKegClYg5+188qVOAM8K0ywSgD8F9hLk9k=;
 b=hnfegLsZQ2Ml8Z6saTYR4l2KDU/3DMiBTXA6lw5ajqfEcvymb5szdOhLBs//IUo2Oijl
 6pCRJ4IcALSHquek1lBEAKlKoVZVuHEJ8lJzMK0VT44yoSlebg0K3knjyygDd9ghKZrO
 kelOZVq1ZTeb+d8tx+3rwL5ryhlK0V+jJdy16zu80HuungHmJFwHVHAqesZznfZOUM+k
 pz33x+eJJd6WDezYorkPXIXx9nEwxpPwhurNWg/lqinf/KGp/Hn/iDm0SI1o9Xwnjc65
 hXhrPKkiHVC4HcOWdAhBZHIRg8fyu16KKT7VJ/JgiGjrf6X198VIGTBeVslZ/OGTyToC YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0hg4a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 12:10:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C94BF100034;
        Fri, 27 Mar 2020 12:10:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA9962A5549;
        Fri, 27 Mar 2020 12:10:20 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 12:10:20 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 12:10:20 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
Thread-Topic: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
Thread-Index: AQHWAiWk1GS4zIhFTUOu115W1GgRU6hcS/JQ
Date:   Fri, 27 Mar 2020 11:10:20 +0000
Message-ID: <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-7-mathieu.poirier@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-27_03:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 06/17] remoteproc: Introduce function
> rproc_alloc_internals()
>=20
> In preparation to allocate the synchronisation operation and state
> machine, spin off a new function in order to keep rproc_alloc() as
> clean as possible.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
> -
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index ee277bc5556c..9da245734db6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
> const struct rproc_ops *ops)
>  	return 0;
>  }
>=20
> +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> +				 const struct rproc_ops *boot_ops,
> +				 const char *firmware, int len)

len argument is not used in the patch nor in the following, maybe removed f=
rom my pov.

Regards,
Loic
> +{
> +	int ret;
> +
> +	/* We have a boot_ops so allocate firmware name and operations */
> +	if (boot_ops) {
> +		ret =3D rproc_alloc_firmware(rproc, name, firmware);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D rproc_alloc_ops(rproc, boot_ops);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t
> char *name,
>  	rproc->dev.class =3D &rproc_class;
>  	rproc->dev.driver_data =3D rproc;
>=20
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto out;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> +	if (rproc_alloc_internals(rproc, name, ops,
> +				  firmware, len))
>  		goto out;
>=20
>  	/* Assign a unique device index and name */
> --
> 2.20.1

