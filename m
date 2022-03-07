Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0474D06A1
	for <lists+linux-remoteproc@lfdr.de>; Mon,  7 Mar 2022 19:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235317AbiCGShE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 7 Mar 2022 13:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbiCGShD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Mar 2022 13:37:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4257588787;
        Mon,  7 Mar 2022 10:36:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E12A3B81670;
        Mon,  7 Mar 2022 18:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41139C340EB;
        Mon,  7 Mar 2022 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646678165;
        bh=ii0ll0RMsBU18K5O3Jz81He0/dDV8RCSC8Mq50rNmkU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sQh/TCO2ak5rmWpM1m29wkAQI5cGXCs7/zmX/aYR1FBI6uOD1J3lpJ2p0CRYOgb5Q
         GZsWjowIrawJJ0rvOOT5fYGFeWq6ZopxMCRJpFTg4T1LSTMf8erT0V7UBFVjtLrA4n
         ZqvtV0bOwGcSdXHUlrA3ow7zBltSeDU5HY6I6arfaQIy568SMbWeHg0U05zwuK9bDu
         Yq6r9OWsgPNjysoib9hQ+eVQrKoQlq/d/TYqCWPGv+XCMDfTg4/d17LGx1JPHdlZD5
         ib+NY28xg5Jzuh+uZvep4Cn0HtyteqDKjBLBpebyhxHKFgpNDIQGktkz9LQqDuX0O6
         3ICTJyoWTy9Mw==
Message-ID: <5a9210d9-c726-1ef9-4bf2-716f2ed1fb8b@kernel.org>
Date:   Mon, 7 Mar 2022 20:35:58 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Add interconnect path proxy vote
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220225033224.2238425-1-bjorn.andersson@linaro.org>
From:   Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20220225033224.2238425-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 25.02.22 5:32, Bjorn Andersson wrote:
> Many remoteproc instances requires that Linux casts a proxy vote for an
> interconnect path during boot, until they can do it themselves. Add
> support for voting for a single path.
> 
> As this is a shared problem between both PAS and MSS drivers, the path
> is acquired and votes casted from the common helper code.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Sibi posted recently a patch to add interconnect votes from the modem driver,
> today I needed the same feature for one of the PAS remoteprocs. After
> essentially duplicating Sibi's patch I realized that it doesn't look too bad to
> put this in the common Q6V5 code.
> 
> The main difference is that this would be messy if we need to support multiple
> paths, so we probably would have to push it out to the individual drivers at
> that point.
> 
> Sibi's patch can be found here.
> https://lore.kernel.org/all/1644813252-12897-3-git-send-email-quic_sibis@quicinc.com/
> 
> 
> This makes the implementation pick up one path, relevant DT bindings would
> still need to be updated in order be allowed to this in the DeviceTree files.
> 
>   drivers/remoteproc/qcom_q6v5.c | 21 ++++++++++++++++++++-
>   drivers/remoteproc/qcom_q6v5.h |  3 +++
>   2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 442a388f8102..5280ec9b5449 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -8,6 +8,7 @@
>    */
>   #include <linux/kernel.h>
>   #include <linux/platform_device.h>
> +#include <linux/interconnect.h>
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/soc/qcom/qcom_aoss.h>
> @@ -51,9 +52,17 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
>   {
>   	int ret;
>   
> +	ret = icc_set_bw(q6v5->path, 0, UINT_MAX);
> +	if (ret < 0) {
> +		dev_err(q6v5->dev, "failed to set bandwidth request\n");
> +		return ret;
> +	}
> +
>   	ret = q6v5_load_state_toggle(q6v5, true);
> -	if (ret)
> +	if (ret) {
> +		icc_set_bw(q6v5->path, 0, 0);
>   		return ret;
> +	}
>   
>   	reinit_completion(&q6v5->start_done);
>   	reinit_completion(&q6v5->stop_done);
> @@ -78,6 +87,9 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
>   	disable_irq(q6v5->handover_irq);
>   	q6v5_load_state_toggle(q6v5, false);
>   
> +	/* Disable interconnect vote, in case handover never happened */
> +	icc_set_bw(q6v5->path, 0, 0);
> +
>   	return !q6v5->handover_issued;
>   }
>   EXPORT_SYMBOL_GPL(qcom_q6v5_unprepare);
> @@ -160,6 +172,8 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>   	if (q6v5->handover)
>   		q6v5->handover(q6v5);
>   
> +	icc_set_bw(q6v5->path, 0, 0);
> +
>   	q6v5->handover_issued = true;
>   
>   	return IRQ_HANDLED;
> @@ -332,6 +346,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>   		return load_state ? -ENOMEM : -EINVAL;
>   	}
>   
> +	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
> +	if (IS_ERR(q6v5->path))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
> +				     "failed to acquire interconnect path\n");
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(qcom_q6v5_init);

Probably we should also call icc_put(q6v5->path) in qcom_q6v5_deinit().

Reviewed-by: Georgi Djakov <djakov@kernel.org>

Thanks,
Georgi
