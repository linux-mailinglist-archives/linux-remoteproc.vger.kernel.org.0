Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF946194254
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 16:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgCZPGM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 11:06:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43332 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgCZPGM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 11:06:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02QF6ATD023766;
        Thu, 26 Mar 2020 10:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585235170;
        bh=MmFd+DXKFRMpZ1XzlUCpSBRoS7PDwSRJ43e7v69uh0s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bDJG/vp2MI5bO0O9tgpi+P/jrYhVI/1caHK++/s+MdlUO+J7gcZEEVk8C5lWv2nze
         9u3mLzLWgY+6R/BTEAAIcjSgIqqTC4Ovf+Rwf9JUmk5zhPZzrDaZAGa1njZiVxXqRX
         Xxa8FxufLqTj4ZEnCa+hmg7mRmqfFO2Wz5CLWwA8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02QF6AMQ105313
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Mar 2020 10:06:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 26
 Mar 2020 10:06:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 26 Mar 2020 10:06:10 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02QF690R128137;
        Thu, 26 Mar 2020 10:06:09 -0500
Subject: Re: [PATCH v2] rpmsg: core: Add wildcard match for name service
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200310155058.1607-1-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <591bd727-32af-9ea2-8c46-98f46ee3711e@ti.com>
Date:   Thu, 26 Mar 2020 10:06:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200310155058.1607-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/10/20 10:50 AM, Mathieu Poirier wrote:
> Adding the capability to supplement the base definition published
> by an rpmsg_driver with a postfix description so that it is possible
> for several entity to use the same service.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

So, the concern I have here is that we are retrofitting this into the
existing 32-byte name field, and the question is if it is going to be
enough in general. That's the reason I went with the additional 32-byte
field with the "rpmsg: add a description field" patch.

regards
Suman

> ---
> Changes for V2:
> - Added Arnaud's Acked-by.
> - Rebased to latest rproc-next.
> 
>  drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..bfd25978fa35 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>  				  const struct rpmsg_device_id *id)
>  {
> -	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> +	size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
> +
> +	/*
> +	 * Allow for wildcard matches.  For example if rpmsg_driver::id_table
> +	 * is:
> +	 *
> +	 * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
> +	 *      { .name = "rpmsg-client-sample" },
> +	 *      { },
> +	 * }
> +	 *
> +	 * Then it is possible to support "rpmsg-client-sample*", i.e:
> +	 *	rpmsg-client-sample
> +	 *	rpmsg-client-sample_instance0
> +	 *	rpmsg-client-sample_instance1
> +	 *	...
> +	 *	rpmsg-client-sample_instanceX
> +	 */
> +	return strncmp(id->name, rpdev->id.name, len) == 0;
>  }
>  
>  /* match rpmsg channel and rpmsg driver */
> 

