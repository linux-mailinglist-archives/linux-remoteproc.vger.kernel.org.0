Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102901B0109
	for <lists+linux-remoteproc@lfdr.de>; Mon, 20 Apr 2020 07:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgDTFiK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Apr 2020 01:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgDTFiK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 01:38:10 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0131C061A10
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:38:09 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so4405255pfc.12
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vXuywTNcLCyXfTRCxE+/gbb1J166gbMzJgknZr7hvR8=;
        b=QTdCHYpBWRjtP0C4ZMM3bnQLyxnOq96YEAJGGD0d78YRbQeZQT8OnZbNZjwnEzHua8
         Vknv71fXdd2Qj/rQK+wRt2jNvPa+0uPEzUFlczgphZpuDNvlkG7/dplzSHE2CU69xi0m
         bkQKbkS5Tzf8EOz35CSAlzVUmEhuOyaRiwsG4m+/8TzyHaxfZYNtaTaTfx95Vhrr9o4K
         UHqadDGzSpBfM5Ovg60skbf0nxGNBNltrwpLNRqkmDU3jd8mEo7yUpfX7C+JxrX/d8Nl
         sU1BQCPyQFK5NcKr0MmerpWTLfhcomYPEp1wvxvjU+vXG8+X49UAHFUA6vVH+eMdQHsf
         YcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vXuywTNcLCyXfTRCxE+/gbb1J166gbMzJgknZr7hvR8=;
        b=oGMd2oFkYcc2D+pfKN2FfIxH0RUJTQGaeUuTsLdBscggeiMT4CsApuVQEqYt3gghrY
         GETB21x8gPnh2eklZyPZEj2B9yfewaIIVS8sZpDN+W3IWdme4RWI6uG+07W6YsLLF9CQ
         jYbPs0fxZxR+YW2pOMzeamQpc4Eg4LInOuOw7HjsUQ+po37vShBDRjywrTWJOiHDNJdg
         vcoAClulYdCpVa4IqjztJucNAvi9yWC8ZusC/tQhRNsAISPW4PAduoYEHz0aRsHXaBVG
         6p/oUJtuYjNgRMF2AlyweCdpUKjYmJzHXlct6kFgHkm+qTSi0QhWHtzwNQQfe8FyQP1L
         mCVA==
X-Gm-Message-State: AGi0PuajHvjBt9wi+KCXU3em4e2vzXWjPENIrap3AUyjgfFNNKrQF2zb
        StjjM7qRfy/1vNqS/xz/9Sjz5Q==
X-Google-Smtp-Source: APiQypKbM9MWn5psD/g3DSNrwZ2q4sHKh/sP1sgRu/OJZVr7IHFEztIdXYyLOc0WGGxhnqioUWIZ2w==
X-Received: by 2002:aa7:9a84:: with SMTP id w4mr15363759pfi.111.1587361089160;
        Sun, 19 Apr 2020 22:38:09 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c80sm12136004pfb.82.2020.04.19.22.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:38:08 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:38:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom: Add SC7180 MPSS
 support
Message-ID: <20200420053831.GG1516868@builder.lan>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417142605.28885-2-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:

> Add MPSS PAS support for SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9938918b2fea3..22604d2cd3f87 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -15,6 +15,7 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,qcs404-adsp-pas"
>  		    "qcom,qcs404-cdsp-pas"
>  		    "qcom,qcs404-wcss-pas"
> +		    "qcom,sc7180-mpss-pas"
>  		    "qcom,sdm845-adsp-pas"
>  		    "qcom,sdm845-cdsp-pas"
>  		    "qcom,sm8150-adsp-pas"
> @@ -46,6 +47,7 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-slpi-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  	qcom,qcs404-wcss-pas:
> +	qcom,sc7180-mpss-pas:
>  	qcom,sm8150-mpss-pas:
>  		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
>  		    "shutdown-ack"
> @@ -106,6 +108,7 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-adsp-pas:
>  	qcom,sm8150-cdsp-pas:
>  		    must be "cx", "load_state"
> +	qcom,sc7180-mpss-pas:
>  	qcom,sm8150-mpss-pas:
>  		    must be "cx", "load_state", "mss"
>  	qcom,sm8150-slpi-pas:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
