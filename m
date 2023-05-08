Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EC26FA151
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 May 2023 09:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbjEHHp1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 May 2023 03:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbjEHHp0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 May 2023 03:45:26 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1BB1C0D6
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 May 2023 00:45:23 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac806f4fccso47435941fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 May 2023 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683531921; x=1686123921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAz7GZnmIeznEXKBKn5jRxKL983QPWlvPE9e0rtjyTI=;
        b=k/a1dwS95HVo/BKWX4YLzrqd4ZbKHsgJwW84rmLG/gsjUH7rbBEsX17DIqlXDcA66n
         GcEndMFwihGu70y/q9+nXlc8Raa+Vc2KtXs9v/6Ib8GNyszadifcidPytkYl5gT8j5IS
         L3uJkNKx9FmjIM+6bR88bqIxcoXWcAz3SYQsVyCC9ramjJTBZJPJ6XLcxd10r0Zb06I4
         E8pVuNLSPXqMMm7DWWTpOGiF6SYdauwNCq+5IeHASdxordh/0XAW635jPgETDvDuooCK
         1Jc5bycf2Ppm4Y2vqJV8IPM36gzdbog6cefTW3QtTZhVYzlF8x0FqYjtuwXqB8rUO+4s
         7phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683531921; x=1686123921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAz7GZnmIeznEXKBKn5jRxKL983QPWlvPE9e0rtjyTI=;
        b=W2sZWeuClrUEi/NUuO0UB6mQ9fpih/1qqqiTvJMOgqYcdMcKOdFLLYw2cKszopOkvN
         LpIqpjKoW0YRrJ/ZnydWgI1/e5Hb9HAo5vYSq2MzX+MyzpszuAPJni0+S9tqRvGY6AWa
         ADDPIpk3EXezE3qU1XBV9iKmfg2lFYC9KwdS2oLc7YFlMmghSgP50PlTD1QWXShtRP7R
         IZu3kwgCTDfcxTsO1BRqwG2FH2CHEBzSmA9WOSaghGkiAz3tFOXDnGGZ3vniRScvA2Rv
         S17XGTDIM6ARqnYgjr+aRIo0blxReIl52H5eI92CjIa8TpQxjjOdiON/XkXzkLhFBovn
         nTYg==
X-Gm-Message-State: AC+VfDxCoL3u/lyl3stzO1JEHVTwbzyzW42S5RluhFH1AXSPRgYvAxnd
        cA8SfTYF646Yl5LleoGsFhif4g==
X-Google-Smtp-Source: ACHHUZ7cagHsaHneag63ciMBUBT40ZwWBdt/xZ1gsskf8BIe/PlccWkiP0aeqmm5C7m7cx4LeqoygQ==
X-Received: by 2002:a2e:b61b:0:b0:2ac:76dc:b067 with SMTP id r27-20020a2eb61b000000b002ac76dcb067mr2714541ljn.10.1683531921521;
        Mon, 08 May 2023 00:45:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id u4-20020a2ea164000000b002a8bbd919f8sm1094898ljl.6.2023.05.08.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:45:21 -0700 (PDT)
Message-ID: <d52e059a-450c-ada2-fd28-48428ed194a4@linaro.org>
Date:   Mon, 8 May 2023 09:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230507172041.2320279-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507172041.2320279-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7.05.2023 19:20, Dmitry Baryshkov wrote:
> On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
> the ELF file. Skip the ELF headers if mba.mbn was specified as the
> firmware image.
> 
> Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ab053084f7a2..1603c5be44c8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -477,7 +477,11 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  		return -EBUSY;
>  	}
>  
> -	memcpy(mba_region, fw->data, fw->size);
> +	if (qproc->version == MSS_MSM8974 &&
> +	    !memcmp(fw->data, ELFMAG, SELFMAG))
> +		memcpy(mba_region, fw->data + 0x1000, fw->size - 0x1000);
I think this deserves some kind of a define instead of just a magic no

Konrad
> +	else
> +		memcpy(mba_region, fw->data, fw->size);
>  	q6v5_debug_policy_load(qproc, mba_region);
>  	memunmap(mba_region);
>  
