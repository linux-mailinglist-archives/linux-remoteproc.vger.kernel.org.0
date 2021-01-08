Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5402EEA5F
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Jan 2021 01:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbhAHA0K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 7 Jan 2021 19:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbhAHA0J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 19:26:09 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4679BC0612F5
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 16:25:29 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id l200so9470335oig.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 16:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oGrTk/yeWTnA31Jo270+ll4E9/49b7ZKp7EyAwvneEU=;
        b=JQnuGnxvD3JKHHFEOGkLTIbvO3B6yCKNSW3xHDtM8s96yHFXZ7FF7o97pYgpIFkCq1
         kFLW4qOp6ubT+Cww0VuN+E4BzaWTr+WXK5UL3bCOx3PteGnqshU9kyAYkrf84sZ1IFRc
         WKrNkzZ7tnbgwn+fMwKpEiuSt86kijf0WG+p5w+cKIljzRsDHncnxhrqWNE6G23agUv/
         JLspzH0S2GYzv2YFzfj5bAbyxgwGWJ+CZ64IsciEE2E7JljFBTdpj0xrbWU7m7GeJg+a
         0cl3BwXr+dGZ2F2998OUcj7CzVhLmWoWoqcpZUYDGzzMSsONRQDyZKyegxA3PxzuUl5d
         Qktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oGrTk/yeWTnA31Jo270+ll4E9/49b7ZKp7EyAwvneEU=;
        b=Hl1CT1JcMWDi9At6/ojuhxJXhtln8Y90PtIy6Q1RxBzV/2aQ1Xx4YUSK/ThQ3Qb4/P
         mFYYILxSYgAn9j8qeCjj13p6dQSsX7O1IwZXiOIISyRamq8xABwepSzcHIPvHUEc8qgr
         CeJGUyIY2MZj4MRa48KfNHE0q4yS87OZyyD2yMSCFwOzuUq3BVeQzvHVUC7n2KVrreTR
         RJTV9/FmBz9aScDiY4o0iyBZu6LiGCFfkAYhUJ3V+4FFnvW1RWJ+LqTk1meXbPMKoZpD
         Mw3k75k3F3rp9awZu+Ax5pHL1d7m/y+8SQeh2W3heT0xm9xOFJ2RYNA43wTaDyWdtFPB
         G/jA==
X-Gm-Message-State: AOAM530m7bDyDVhN6ieYt5eS9w+hVTG0cZpoiDxBmTu3YU7yGGv25xGO
        Kcw+bYzPLMlnrnfzXn96cgIWiw==
X-Google-Smtp-Source: ABdhPJz61kjLr8UxAKdXVaYNqcpc2qFRGRYSF7r8UUIqv49dlBUOXcEScowP73at/yGrjt88LY8QWw==
X-Received: by 2002:aca:2302:: with SMTP id e2mr752952oie.94.1610065528628;
        Thu, 07 Jan 2021 16:25:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10sm1474227otn.63.2021.01.07.16.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 16:25:27 -0800 (PST)
Date:   Thu, 7 Jan 2021 18:25:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, agross@kernel.org,
        ohad@wizery.com, evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/4] net: ipa: support COMPILE_TEST
Message-ID: <X/emdfMiot199HR7@builder.lan>
References: <20210107233404.17030-1-elder@linaro.org>
 <20210107233404.17030-5-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107233404.17030-5-elder@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 07 Jan 17:34 CST 2021, Alex Elder wrote:

> Arrange for the IPA driver to be built when COMPILE_TEST is enabled.
> 
> Update the help text to reflect that we support two Qualcomm SoCs.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/net/ipa/Kconfig | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 9f0d2a93379c5..10a0e041ee775 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -1,9 +1,10 @@
>  config QCOM_IPA
>  	tristate "Qualcomm IPA support"
> -	depends on ARCH_QCOM && 64BIT && NET
> -	depends on QCOM_Q6V5_MSS
> +	depends on 64BIT && NET
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
> +	select QCOM_MDT_LOADER if ARCH_QCOM
>  	select QCOM_QMI_HELPERS
> -	select QCOM_MDT_LOADER
>  	help
>  	  Choose Y or M here to include support for the Qualcomm
>  	  IP Accelerator (IPA), a hardware block present in some
> @@ -11,7 +12,8 @@ config QCOM_IPA
>  	  that is capable of generic hardware handling of IP packets,
>  	  including routing, filtering, and NAT.  Currently the IPA
>  	  driver supports only basic transport of network traffic
> -	  between the AP and modem, on the Qualcomm SDM845 SoC.
> +	  between the AP and modem, on the Qualcomm SDM845 and SC7180
> +	  SoCs.
>  
>  	  Note that if selected, the selection type must match that
>  	  of QCOM_Q6V5_COMMON (Y or M).
> -- 
> 2.20.1
> 
