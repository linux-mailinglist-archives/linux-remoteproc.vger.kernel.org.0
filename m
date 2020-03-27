Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDB21955F6
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 12:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgC0LGN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 07:06:13 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:13106 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbgC0LGN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 07:06:13 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RB49Tr005511;
        Fri, 27 Mar 2020 12:06:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BkPo9i+CQo1BdLxEPO9sQgD9Z2i2lfEU7kh865ZUDMQ=;
 b=WKmlUFo/y5ev/Sfn7lfrLk5jwAplrdmWrMXMmGtlYJQnBjHQz3IQcpet1RqEiYSYhsma
 jm33ter54zvGcHZpKVv+XSPeFP/7FYX0FFt2x+bP1E2C6h+Ei4ZWMe6adfatsOF+Cikn
 kWbDHpLHqGbm/6z0Mm7/1iV2Z6+JBtGF+Ei1QR4Kx2hpD4XqTJqj+48J5HRDzK/urLef
 Qh9TzZEatyq3vk8KrLCw0DR81HYU0UXJEo96CbNPXxbfVudSbC7jiTw9UbSGryOzPjwg
 Kka6UluG1XyKP384oye+P9RooW7ETbgISpKD+1bzYGp2oXF5fXKw0NVgs9VS1qJqLFOp sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9961haf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 12:06:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A80A100034;
        Fri, 27 Mar 2020 12:05:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5881F2A5541;
        Fri, 27 Mar 2020 12:05:57 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 12:05:56 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 12:05:56 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
Thread-Topic: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
Thread-Index: AQHWAiWiMFL9vrg4EEWZ9deexWiQ+qhcSoAQ
Date:   Fri, 27 Mar 2020 11:05:56 +0000
Message-ID: <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-4-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-4-mathieu.poirier@linaro.org>
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
> Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
> rproc_alloc()
>=20
> Make the firmware name allocation a function on its own in order to
> introduce more flexibility to function rproc_alloc().
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..c0871f69929b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1962,6 +1962,36 @@ static const struct device_type rproc_type =3D {
>  	.release	=3D rproc_type_release,
>  };
>=20
> +static int rproc_alloc_firmware(struct rproc *rproc,
> +				const char *name, const char *firmware)
> +{
> +	char *p, *template =3D "rproc-%s-fw";
> +	int name_len;
> +
> +	if (!rproc || !name)
> +		return -EINVAL;
> +
> +	if (!firmware) {
> +		/*
> +		 * If the caller didn't pass in a firmware name then
> +		 * construct a default name.
> +		 */
> +		name_len =3D strlen(name) + strlen(template) - 2 + 1;
> +		p =3D kmalloc(name_len, GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +		snprintf(p, name_len, template, name);
> +	} else {
> +		p =3D kstrdup(firmware, GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +	}
> +
> +	rproc->firmware =3D p;
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev,
> const char *name,
>  			  const char *firmware, int len)
>  {
>  	struct rproc *rproc;
> -	char *p, *template =3D "rproc-%s-fw";
> -	int name_len;
>=20
>  	if (!dev || !name || !ops)
>  		return NULL;
>=20
> -	if (!firmware) {
> -		/*
> -		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.
> -		 */
> -		name_len =3D strlen(name) + strlen(template) - 2 + 1;
> -		p =3D kmalloc(name_len, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -		snprintf(p, name_len, template, name);
> -	} else {
> -		p =3D kstrdup(firmware, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -	}
> -
>  	rproc =3D kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> -	if (!rproc) {
> -		kfree(p);
> +	if (!rproc)
>  		return NULL;
> -	}
> +
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto free_rproc;
>=20
>  	rproc->ops =3D kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>  	if (!rproc->ops) {
> -		kfree(p);
> +		kfree(rproc->firmware);
>  		kfree(rproc);
Small remark only for patch coherency, as it is modified in next patches.
Use free_rproc label which is introduced just below here for error manageme=
nt.

Regards,
Loic
>  		return NULL;
>  	}
>=20
> -	rproc->firmware =3D p;
>  	rproc->name =3D name;
>  	rproc->priv =3D &rproc[1];
>  	rproc->auto_boot =3D true;
> @@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t
> char *name,
>  	rproc->state =3D RPROC_OFFLINE;
>=20
>  	return rproc;
> +
> +free_rproc:
> +	kfree(rproc);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
>=20
> --
> 2.20.1

