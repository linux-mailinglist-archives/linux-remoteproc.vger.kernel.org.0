Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC56E1957C1
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 14:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0NMY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 09:12:24 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23258 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726900AbgC0NMY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 09:12:24 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RD4bmj032472;
        Fri, 27 Mar 2020 14:12:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4hIECdYx0CxG/4pmCURdKvl+Jib9X2m8auZP/tPOwMw=;
 b=eg9uUNgsNheKpiONbIEJ6J5YMHIlldqzPs804ozTBNoWvhzQdzTbvb3Uied0dZMffbIW
 QQQaDLPRlUwtip8DTVjTbcKlp3+9WHi4ioNqpYdQYl2oJJ308CDZHuGKgH1n2z+vpTnW
 l7j2XBG0ei09aCJnD2HSaZBgSrBLVtQUFP7pPxxvpm7ZlKtVmYSfxkPXS4eBCGUzexhN
 uOD/vXMnMNLScIu8i9biIypSxghd+Jqge3KCzdgVIVYx6myxqAgJccsaFxx2QfFajgeB
 duFadnLm/8OTnfjiq0cUa2OZd7fLQq2uXb9+cbCDhJZtKcblQJVOAm7lptT3CiCABDMJ Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xejkgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 14:12:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFAEB100034;
        Fri, 27 Mar 2020 14:12:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C13732AC678;
        Fri, 27 Mar 2020 14:12:11 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 14:12:11 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 14:12:11 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v2 07/17] remoteproc: Introduce function
 rproc_alloc_state_machine()
Thread-Topic: [PATCH v2 07/17] remoteproc: Introduce function
 rproc_alloc_state_machine()
Thread-Index: AQHWAiWkYOGvPOS8x0Sx1UUSA01C66hcbVmA
Date:   Fri, 27 Mar 2020 13:12:11 +0000
Message-ID: <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-8-mathieu.poirier@linaro.org>
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
 definitions=2020-03-27_04:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 07/17] remoteproc: Introduce function
> rproc_alloc_state_machine()
>=20
> Introducing new function rproc_alloc_state_machine() to allocate
> the MCU synchronisation operations and position it as the central
> remoteproc core allocation function.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 84
> +++++++++++++++++++++++++---
>  include/linux/remoteproc.h           |  5 ++
>  2 files changed, 81 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 9da245734db6..02dbb826aa29 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
>=20
>  	kfree(rproc->firmware);
>  	kfree(rproc->ops);
> +	kfree(rproc->sync_ops);
>  	kfree(rproc);
>  }
>=20
> @@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc,
> const struct rproc_ops *ops)
>  	return 0;
>  }
>=20
> +static int rproc_alloc_sync_ops(struct rproc *rproc,
> +				const struct rproc_ops *sync_ops)
> +{
> +	/*
> +	 * Given the unlimited amount of possibilities when
> +	 * synchronising with an MCU, no constraints are imposed
> +	 * on sync_ops.
> +	 */
> +	rproc->sync_ops =3D kmemdup(sync_ops,
> +				  sizeof(*sync_ops), GFP_KERNEL);
> +	if (!rproc->sync_ops)
> +		return -ENOMEM;
Should we check a minimal set of functions in sync_ops to be required?
Or we should consider all pointers at NULL is ok ?

> +
> +	return 0;
> +}
> +
>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>  				 const struct rproc_ops *boot_ops,
> +				 const struct rproc_ops *sync_ops,
> +				 struct rproc_sync_states *sync_states,
sync_states not used in this patch, should be introduced in patch 8

Regards,
Loic

>  				 const char *firmware, int len)
>  {
>  	int ret;
>=20
> +	/* We need at least a boot or a sync ops. */
> +	if (!boot_ops && !sync_ops)
> +		return -EINVAL;
> +
>  	/* We have a boot_ops so allocate firmware name and operations */
>  	if (boot_ops) {
>  		ret =3D rproc_alloc_firmware(rproc, name, firmware);
> @@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc
> *rproc, const char *name,
>  			return ret;
>  	}
>=20
> +	/* Allocate a sync_ops if need be */
> +	if (sync_ops) {
> +		ret =3D rproc_alloc_sync_ops(rproc, sync_ops);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>=20
>  /**
> - * rproc_alloc() - allocate a remote processor handle
> + * rproc_alloc_state_machine() - allocate a remote processor handle
>   * @dev: the underlying device
>   * @name: name of this remote processor
>   * @ops: platform-specific handlers (mainly start/stop)
> + * @sync_ops: platform-specific handlers for synchronising with MCU
> + * @sync_states: states in which @ops and @sync_ops are to be used
>   * @firmware: name of firmware file to load, can be NULL
>   * @len: length of private data needed by the rproc driver (in bytes)
>   *
> @@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc
> *rproc, const char *name,
>   * Note: _never_ directly deallocate @rproc, even if it was not register=
ed
>   * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free()=
.
>   */
> -struct rproc *rproc_alloc(struct device *dev, const char *name,
> -			  const struct rproc_ops *ops,
> -			  const char *firmware, int len)
> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> *name,
> +					const struct rproc_ops *ops,
> +					const struct rproc_ops *sync_ops,
> +					struct rproc_sync_states
> *sync_states,
> +					const char *firmware, int len)
>  {
>  	struct rproc *rproc;
>=20
> -	if (!dev || !name || !ops)
> +	if (!dev || !name)
>  		return NULL;
>=20
>  	rproc =3D kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> @@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> char *name,
>  	rproc->dev.class =3D &rproc_class;
>  	rproc->dev.driver_data =3D rproc;
>=20
> -	if (rproc_alloc_internals(rproc, name, ops,
> -				  firmware, len))
> +	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
> +				  sync_states, firmware, len))
>  		goto out;
>=20
>  	/* Assign a unique device index and name */
> @@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t
> char *name,
>  	put_device(&rproc->dev);
>  	return NULL;
>  }
> -EXPORT_SYMBOL(rproc_alloc);
> +EXPORT_SYMBOL(rproc_alloc_state_machine);
> +
> +/**
> + * rproc_alloc() - allocate a remote processor handle
> + * @dev: the underlying device
> + * @name: name of this remote processor
> + * @ops: platform-specific handlers (mainly start/stop)
> + * @firmware: name of firmware file to load, can be NULL
> + * @len: length of private data needed by the rproc driver (in bytes)
> + *
> + * Allocates a new remote processor handle, but does not register
> + * it yet. if @firmware is NULL, a default name is used.
> + *
> + * This function should be used by rproc implementations during
> initialization
> + * of the remote processor.
> + *
> + * After creating an rproc handle using this function, and when ready,
> + * implementations should then call rproc_add() to complete
> + * the registration of the remote processor.
> + *
> + * On success the new rproc is returned, and on failure, NULL.
> + *
> + * Note: _never_ directly deallocate @rproc, even if it was not register=
ed
> + * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free()=
.
> + */
> +struct rproc *rproc_alloc(struct device *dev, const char *name,
> +			  const struct rproc_ops *ops,
> +			  const char *firmware, int len)
> +{
> +	if (!name && !firmware)
> +		return NULL;
> +
> +	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
> +					 firmware, len);
> +}
>=20
>  /**
>   * rproc_free() - unroll rproc_alloc()
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index d115e47d702d..d1214487daac 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device
> *dev);
>  struct rproc *rproc_alloc(struct device *dev, const char *name,
>  			  const struct rproc_ops *ops,
>  			  const char *firmware, int len);
> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> *name,
> +					const struct rproc_ops *ops,
> +					const struct rproc_ops *sync_ops,
> +					struct rproc_sync_states
> *sync_states,
> +					const char *firmware, int len);
>  void rproc_put(struct rproc *rproc);
>  int rproc_add(struct rproc *rproc);
>  int rproc_del(struct rproc *rproc);
> --
> 2.20.1

