Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1631C58B830
	for <lists+linux-remoteproc@lfdr.de>; Sat,  6 Aug 2022 22:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiHFUYe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 6 Aug 2022 16:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiHFUYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Aug 2022 16:24:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827EBF5BF
        for <linux-remoteproc@vger.kernel.org>; Sat,  6 Aug 2022 13:24:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d14so7641159lfl.13
        for <linux-remoteproc@vger.kernel.org>; Sat, 06 Aug 2022 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=L81E5ZZqDFMGva8vhhqWkoOGy11PnHnlgRUepkoIMRE=;
        b=pNdpumK7dRQhTNmHg8fHd8fARN5aLciY1pJEgeA7VjWorBMCYCR6avAs1H+8NrAYct
         P9kTl/xB+Vu961rEUoPwBL4R039PxxFH/vmMzr8VYmJC26a/L70QO7yDRaSed1sb9Q/4
         XQB3Yh062v9NkzV8BIW6xJutSFYZwMKIMTzxwcqaMvcUgEP9E4vMeJ9qmKrTXJcYeCZE
         qofJcZhZUnY815TH6kncoUIDwuhvGPEbBa1SjMmuDslMRQV6XzubsornP323VPKaabBB
         fMvgYMO83PEJMQGXm/KDtRJjRB8GmdXFoVKYskimlWWa8EY7ZfQN/ZPqambnDleVMMj2
         PCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=L81E5ZZqDFMGva8vhhqWkoOGy11PnHnlgRUepkoIMRE=;
        b=J4WY2MJ2BjY5PVZS5FYfNtucgg78KLkBFtX2grTGh6PKzU9NZQBdN6hVpOgrov7MnK
         JQS44ccK9OMzKuoe0nqq8IOkZlIqI/+RQHRlT6Ig9dxVe/b6PpjghiEQVmq4SU2FICT6
         Ma2tCep5EGQEtVwpuVyBa9QwVGYZ4O3CtYybKGIqU4Vjp6T/8TwHXj1scgTYzTac0DSI
         wsreVyKfB0sP6qRs/hcmDMll56sGt+kc0MVQlWSmC7wENXT0mHn47l342YPQ4Lv0TJ5i
         ggd12YwMxwNTac3UZrgrqngh3CHWbVLB4FJUR+utqxg8LKVmPB3asvoDiy0KzrBz1Oxc
         802w==
X-Gm-Message-State: ACgBeo3jY/7cEvXVqqxalTw2BBCQGsNhJKEfwM6u6KjcbPkrP0Vjuael
        7Hd1leOSUp/rR1LUGxBBeJO2WA==
X-Google-Smtp-Source: AA6agR5lVvAiHeEcNLAV5iU350kW/Ex4qB3rNv32eRKWqNAJmpEum8Ysgv9e2ievMPN0opC9S5br/g==
X-Received: by 2002:a05:6512:1155:b0:48a:fb9a:32d8 with SMTP id m21-20020a056512115500b0048afb9a32d8mr4083593lfg.672.1659817470728;
        Sat, 06 Aug 2022 13:24:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512228a00b0048b2be5320csm864540lfu.118.2022.08.06.13.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 13:24:30 -0700 (PDT)
Message-ID: <2aec8537-47b0-5e80-b2cf-70084652f64e@linaro.org>
Date:   Sat, 6 Aug 2022 23:24:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/8] remoteproc: qcom: Update hard coded values with
 macros
Content-Language: en-GB
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        devicetree@vger.kernel.org
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
 <1659536480-5176-5-git-send-email-quic_srivasam@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659536480-5176-5-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/08/2022 17:21, Srinivasa Rao Mandadapu wrote:
> Update hard coded values with appropriate macro names.

'Replace'

Other than that,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index bb4494c..a9fcb5c 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -54,6 +54,9 @@
>   
>   #define QCOM_Q6V5_RPROC_PROXY_PD_MAX	3
>   
> +#define LPASS_BOOT_CORE_START	BIT(0)
> +#define LPASS_BOOT_CMD_START	BIT(0)
> +
>   struct adsp_pil_data {
>   	int crash_reason_smem;
>   	const char *firmware_name;
> @@ -364,10 +367,10 @@ static int adsp_start(struct rproc *rproc)
>   	writel(adsp->mem_phys >> 4, adsp->qdsp6ss_base + RST_EVB_REG);
>   
>   	/* De-assert QDSP6 stop core. QDSP6 will execute after out of reset */
> -	writel(0x1, adsp->qdsp6ss_base + CORE_START_REG);
> +	writel(LPASS_BOOT_CORE_START, adsp->qdsp6ss_base + CORE_START_REG);
>   
>   	/* Trigger boot FSM to start QDSP6 */
> -	writel(0x1, adsp->qdsp6ss_base + BOOT_CMD_REG);
> +	writel(LPASS_BOOT_CMD_START, adsp->qdsp6ss_base + BOOT_CMD_REG);
>   
>   	/* Wait for core to come out of reset */
>   	ret = readl_poll_timeout(adsp->qdsp6ss_base + BOOT_STATUS_REG,


-- 
With best wishes
Dmitry
