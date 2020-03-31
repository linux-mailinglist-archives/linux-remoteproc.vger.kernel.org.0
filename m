Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D903519A298
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 01:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbgCaXll (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 19:41:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38816 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731331AbgCaXlk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 19:41:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id c21so10489020pfo.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2020 16:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kgLg1BYMpswLOvaY9ouREHThum7EqW/Wb2UtLfVPDwA=;
        b=mRqmaUgoOW9VnbKgx4EF0ko6I3gfQVayMY4tJ2KbUJwDw6KyIFwM3GYQ3zv6iwPfDA
         RBj7069dKZ7bUxg+TF5m3UxXR1+LM79xl51LOpF1ztxjrT9RN69vCvl8pcShYculTJRu
         XZLW0nI4bg5rC2m/ln/Y4GNh0P00XwtvlwYYoH+wnPGSz1fE9aNuheBrgFPitLVK4D8j
         0tc6pHbeZWS88bb9hFgA/XOD/P6dlxVFKLt07HeT1whYTLhZf1/1E3wWUdht2AxOhfYT
         8dt33gRdJl9DmRe/FIhGc3AylBB1+l1w/rTh3Ok1t0cZKTwismTjg89tvCSn1BoPMfMD
         yYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kgLg1BYMpswLOvaY9ouREHThum7EqW/Wb2UtLfVPDwA=;
        b=Sj6DJuloUVsCtpevcKju3zFerRUtkwsWTxlF1uahi8RN0rIYU/KJaUPZqFeh18En2s
         gc4oVCJi9kCWlc9Hfo8AOu0JmH1fewXybWRSUsiDXGzj0buc/685QDaotZ/4maqffshO
         sIOiidJputkMIb/V5cieXbEkz+zpPYl2ngG/AW0Pb4y4uBbZuPKWz16Ao1kqm5PNP96y
         iaj1hwX0q1i3H3RWLldxCSrSqw2vhM5qZf2vsgYy39xzmSY3tgrCPf8HcNeGDJ35fy0m
         vfR38IADzYWekY5EJN8dM7AXSLx0/sRT2SGXoR+AbI/jBXgwO7Vg/vYUIzASAiwpS/zK
         vC2Q==
X-Gm-Message-State: AGi0Pubafb9OOoj6b6WZFfHKtmg3ZMyyCfjTicJJBufbhFyIohDE8/hL
        9CcDO9HFUl/72h3A1lpSh07gQw==
X-Google-Smtp-Source: APiQypJMF+3p+OYDbDQ4wyrkTdV5Dob4Zmqb1h73XbhqTI/p2mAJDLPwuix49HbnjKy/j58rekzVAA==
X-Received: by 2002:a63:fd43:: with SMTP id m3mr7937975pgj.129.1585698097837;
        Tue, 31 Mar 2020 16:41:37 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l5sm116369pgt.10.2020.03.31.16.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 16:41:37 -0700 (PDT)
Date:   Tue, 31 Mar 2020 16:41:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Add interconnect property
Message-ID: <20200331234135.GC267644@minitux>
References: <1585357496-6368-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585357496-6368-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 27 Mar 18:04 PDT 2020, Rishabh Bhatnagar wrote:

> Allow proxy voting/unvoting of bus bandwidth for remote
> processors. This property will specify the bus-master and
> slave so that remoteproc platform driver can make the proxy
> vote for bus bandwidth.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9938918..529b0a0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -111,6 +111,17 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-slpi-pas:
>  		    must be "lcx", "lmx", "load_state"
>  
> +- interconnect:

This should be plural; "interconnects".

> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: Specifies the interconnect bus-master and bus-slave for
> +		    bandwidth voting during proxy vote/unvote.
> +
> +- interconnect-names:
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: The interconnect name depends on the compatible string

This should be elaborated upon, similar to e.g. power-domain-names.

Regards,
Bjorn

> +
>  - memory-region:
>  	Usage: required
>  	Value type: <phandle>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
