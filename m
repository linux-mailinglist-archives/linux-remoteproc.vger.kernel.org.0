Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FABD6200C
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Jul 2019 16:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbfGHOH0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 Jul 2019 10:07:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36771 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbfGHOH0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jul 2019 10:07:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so3752726pgm.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jul 2019 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mts5yXroYfI0Wyr9A7s3Gq+YGagV18S7ZKDUSCh+Ia4=;
        b=Ar7KcqqvFoS0ThSHwovLDA9qQWM2EJH3qjIpyKl3b4YnedviunpO7IQp89bVPTPzBk
         P+x6YNfU5ljERwWpQQyXdbBjojZsOcJiP3H04LVHviza9gaRb642lZkAp/urelJg+I72
         Hx8P7Whuj18+wBXeysBAjp/aSXUklw0T295qs2lyX+tqmgRxNcShJOe0Dx4urKsesPdc
         61cW3j13D4Lmbj6YO9aiIZrXQw0GEKmnxz/eEDhRGtVrr7XRiyYVcPpwnGNUt34WLs6V
         MSP2AM0ftxnTtHXp2Vks02n7FExxBXfQdIGKUXeILgz/8okYpn3KCgdHZ/IF+HthdlvD
         fBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mts5yXroYfI0Wyr9A7s3Gq+YGagV18S7ZKDUSCh+Ia4=;
        b=uWLAa8mL9TgAefmq+DnQvH+TzT615u8NXDvs5Z5rJNt0fW2Ue4ta0GQLUr53UAcDRD
         S4/RJzx9ZkLm8jqU6/SXNUH6USfmqi5LZQ+xnVFsgmMhR2tKzy9sZicx9JqKtsG4LJYp
         vjPtvFP11M0kuzTINDvXv9ulYO4O1km3DFpYCSw7B5gwnTXBUdlXXT3Y00R+EdUe/nOl
         vBRwev0ru8RxVAAVUV0sC+Sxhj95WA8KUSuHLhfDmi046tIJcK/f/KgGlNgb2HMzpxTC
         9JNmceul1dMh9bpb1A6YoSUBj1oNAoocZziJgfOVhV1cHGJR/ciNR077DJS3TdrzCG3a
         cvTQ==
X-Gm-Message-State: APjAAAVbm0YlWmFd53MdVpkJFi0oyiwl8wJGewlPIpLNvV9LaxSV6XbM
        eYLiceEE06y3UG1rlm+H+aiRSg==
X-Google-Smtp-Source: APXvYqyOo/VR8k+Lrm9hsqwa/a1o/yTnfvlKDKvFiVcDf1Ab1otQGc7c6JYEVh/QTss3ainGobUAHw==
X-Received: by 2002:a63:5920:: with SMTP id n32mr9668843pgb.352.1562594845697;
        Mon, 08 Jul 2019 07:07:25 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y133sm17699205pfb.28.2019.07.08.07.07.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 07:07:24 -0700 (PDT)
Date:   Mon, 8 Jul 2019 07:07:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: stm32: fix building without ARM SMCC
Message-ID: <20190708140722.GI1263@builder>
References: <20190708124311.3448056-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708124311.3448056-1-arnd@arndb.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 08 Jul 05:42 PDT 2019, Arnd Bergmann wrote:

> When compile testing this driver without SMCC support enabled,
> we get a link error:
> 
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_start':
> stm32_rproc.c:(.text+0x776): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_stop':
> stm32_rproc.c:(.text+0x92c): undefined reference to `__arm_smccc_smc'
> 
> Make the actual call to arm_smccc_smc conditional on the Kconfig
> symbol controlling its implementation.
> 
> Fixes: 13140de09cc2 ("remoteproc: stm32: add an ST stm32_rproc driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, applied

Regards,
Bjorn

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index e83077b9ebf5..e2da7198b65f 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -344,7 +344,7 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (ddata->secured_soc) {
> +	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
>  		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
>  			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
>  		err = smc_res.a0;
> -- 
> 2.20.0
> 
