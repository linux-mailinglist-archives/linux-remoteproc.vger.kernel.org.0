Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DB01AAF0E
	for <lists+linux-remoteproc@lfdr.de>; Wed, 15 Apr 2020 19:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410655AbgDORD6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Apr 2020 13:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404661AbgDORDy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 13:03:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC180C061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 10:03:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 201so255570pfv.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TXmBTmjlGDdkYJ5YaS9MFQANC5ZQIcUdQZgB+/qVJcg=;
        b=FaDHsxJ/Bsq5/mrz/KAm6LRhZzJ4oycH4qGHGQN9l033vBRXCFWhhDAHZx0+xkwcn6
         3d9mqYrLsMXHMiqUyBOvrSZgysqBewL5VEDFgtVWtZ5r5R4iKx0idNL1JXlvFWZkTJG1
         z4/YrF5Wga+eRnhDgvfXrFjJEwsFIlqlBzlRcSojTuj2fo9hu1Gco/ImeqCdmYAyEG7h
         ladEsxtLlmQSyVLOdLCdz9Y6RtEjYQKZnB+Ofr1ZjLsx6jSBvrP7LBYE5Itxoaazm7tz
         FI4TPa2wRScdEcGxXCnlV1c5PskOclAIjNWYYB/RjLot4De6rh4OvuWVsPpy2MGobT+R
         vnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TXmBTmjlGDdkYJ5YaS9MFQANC5ZQIcUdQZgB+/qVJcg=;
        b=SSEASY+V4w74d3s4ghz7cO/QqawhwnWbX08RXDxsVWc4S56Kgc+ZEOrEEtr5cDkNFv
         jT3MDURzcp49Yo8ck9zXG1T1rxkkdPqSHHF3ihxKrECeb0INzlUkUeUkizqM9eS9DTnD
         77ta6hBNZbitbH7tXGdZsY/4Ta5B6a3kv+cHAzKUX/SOAvnZaOV/9j0mGCfpr/PT4NQU
         61ygGdpI1E97O6H+7cAAwVjkaOn8EXOqGVuyue9+VYyekOYiWax8JE/3cxxxIzkFUJL/
         53MaGOEyEewebnzeiWwytLLljvB/nInSWTU2g044AJoDk1z25XZt8r34Qdtn3QhTN05C
         V8Bg==
X-Gm-Message-State: AGi0PuaHso21/XkmX5TK92QtLcZM9IO1UNqV9mbqny1pi2q5nXpVz+Ob
        D3OoKvKI3alWnxem6TSHDBg0QQ==
X-Google-Smtp-Source: APiQypKxA2s9Ixhh/x4lzTu9wFMre6vgaWEw6jKo5l4u/n/V4C6g53A2/FTS+wGYaVfEJGJ7TqgWsQ==
X-Received: by 2002:a62:2506:: with SMTP id l6mr24888469pfl.184.1586970234265;
        Wed, 15 Apr 2020 10:03:54 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i124sm14308027pfg.14.2020.04.15.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:03:53 -0700 (PDT)
Date:   Wed, 15 Apr 2020 11:03:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/6] remoteproc: sysmon: Add notifications for events
Message-ID: <20200415170351.GB16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 08, 2020 at 04:36:39PM -0700, Siddharth Gupta wrote:
> Add notification for other stages of remoteproc boot and shutdown. This
> includes adding callback functions for the prepare and unprepare events,
> and fleshing out the callback function for start.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/qcom_sysmon.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 1366050..851664e 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -439,8 +439,31 @@ static const struct qmi_ops ssctl_ops = {
>  	.del_server = ssctl_del_server,
>  };
>  
> +static int sysmon_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
> +	return 0;
> +}
> +
>  static int sysmon_start(struct rproc_subdev *subdev)
>  {
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
>  	return 0;
>  }
>  
> @@ -464,6 +487,18 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>  		sysmon_request_shutdown(sysmon);
>  }
>  
> +static void sysmon_unprepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +}
> +
>  /**
>   * sysmon_notify() - notify sysmon target of another's SSR
>   * @nb:		notifier_block associated with sysmon instance
> @@ -563,8 +598,10 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  
>  	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
>  
> +	sysmon->subdev.prepare = sysmon_prepare;
>  	sysmon->subdev.start = sysmon_start;
>  	sysmon->subdev.stop = sysmon_stop;
> +	sysmon->subdev.unprepare = sysmon_unprepare;
>  
>  	rproc_add_subdev(rproc, &sysmon->subdev);
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
