Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C40D1D269A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 07:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgENFRa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 May 2020 01:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725788AbgENFR3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 01:17:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B597C061A0E
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:17:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so12056368pjh.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GjJPgwHAWLCdp+4b5y9We0V/4Ec6i8aFUo1gPxwMZ7w=;
        b=MkuhUNV21I7fxjv4MrVDEcmFSHwUJ9lvNGa8cXCPIn1dx62l2uSsNsmmCeUQUAS43c
         nSBL/PzySbiBqaxWXoaUqcFN4ADbjC3t4Xb9Lvu49f4EjFmeUeGrJ3izVna5vv3tvv3q
         CulRTby5nRpPCy1ASOPVRug05M2Ky27e6fZQ+faMWY3rzOeXkdzbjf/QghV0sgzv9sfU
         7TRQ58vGck02M+Wrm/1GoCQ0sdlvDSoFrEOmQo+bQB6vZ1gPEqYB4BwIA7+BHFNlhp/p
         d6BqcGuXO/C2zmjGPLXrbWachYsg3NZ1dIU9EauzT7U0aS9REMPNzBRSGJZ10hk/BUJG
         lOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GjJPgwHAWLCdp+4b5y9We0V/4Ec6i8aFUo1gPxwMZ7w=;
        b=rESEwO+SiJYEDIrBsCX3qXMdyFxx7GpWPClRBANYNQqx+k1YwfiNuD+0gtbG7lcM4r
         rbpmvmRWPCPBStlT+XGFKsbsN67dS5TEDCn8KRAX2WnJ9EnPaYW+e82ZLYJ6PI3uEeYE
         Z3R+/Zdo9SU6dGohL8GaWWACd0cJE0hgL3HaKAx80OaGKXm7xVzys3tj85ANhhkuvan7
         5Behx83wRTxP5rz6/xSU6HqQrEtdRlvRKoGzY8KT1a9vTwsxIGSwjD5z3+AGEHF+p4zO
         hinwkUyaXWnbTWX0/6kNHvXZYwG/JMsOai+A+oLEsI2Gdc1Fy8hBsfipwiKFBZVhWhPt
         fwWg==
X-Gm-Message-State: AOAM532FIXPDUfosMUy4KxUsxQcJ3BboxoMpcf6pw5nzIrqXOVbpPZ+w
        V08/od82bzboXE9c1L44wj2Sew==
X-Google-Smtp-Source: ABdhPJwPKu284FGW2y3JeQslHbE7FXQ0tLPsAtF5Z1Sd1/eTKJSL1+BfVYzPKbw4EN2fAafX5g9fYw==
X-Received: by 2002:a17:902:c406:: with SMTP id k6mr2369370plk.203.1589433447383;
        Wed, 13 May 2020 22:17:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a7sm1126526pfg.157.2020.05.13.22.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:17:26 -0700 (PDT)
Date:   Wed, 13 May 2020 22:15:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/12] remoteproc: stm32: Introduce new loaded rsc ops
 for synchronisation
Message-ID: <20200514051556.GB396285@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-12-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-12-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:25 PDT 2020, Mathieu Poirier wrote:

> Introduce new elf find loaded resource table rproc_ops functions to be
> used when synchonising with an MCU.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


But I would have preferred if we during probe (when we discover rsc_va)
could just set it on the rproc.

Regards,
Bjorn

> ---
>  drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index b8ae8aed5585..dcae6103e3df 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -319,6 +319,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
>  	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
>  }
>  
> +static struct resource_table *
> +stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
> +					   const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +
> +	return (struct resource_table *)ddata->rsc_va;
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -593,6 +602,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
>  	.start		= stm32_rproc_sync_start,
>  	.stop		= stm32_rproc_stop,
>  	.parse_fw       = stm32_rproc_sync_parse_fw,
> +	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>  
>  static const struct of_device_id stm32_rproc_match[] = {
> -- 
> 2.20.1
> 
