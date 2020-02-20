Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02791668D5
	for <lists+linux-remoteproc@lfdr.de>; Thu, 20 Feb 2020 21:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgBTUsU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 20 Feb 2020 15:48:20 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42722 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728969AbgBTUsU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Feb 2020 15:48:20 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so2493951pfz.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Feb 2020 12:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1WiBm057tXslPhIImSbKoDLWRVkA59yvTrK92rOI8dY=;
        b=mmyj9dyF+CjJk09TbY9Npp53aEJZHY9HmBrq51h+LItE7RYtazuYxVlq/yF1iQPq0a
         0+TvbBVnp6QTWt6LTc4ebhkAluV/I31Vpf/3k3g0WX2UCfTTq7qLCium/lociY1cW2PL
         0c3IjXwNyuGhE0jmjGmX28HovNTKzqIKUcaH5FunnS2K8wPWjAqLaUgvh4osPixQRRGb
         JDMzzUzLjgrhJkjOKr7l0GwCI741QFDp1VSYYhZ2PvARqtVLRjeMKLd/JXJB9g4bkwGE
         Pp4ZQoQ3Sn31E1M+48eQO9AFbBHWOrYcVlis47RFraRtiMyZg00INT8GrH4Z5sw2q5pR
         CaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1WiBm057tXslPhIImSbKoDLWRVkA59yvTrK92rOI8dY=;
        b=D046M/Rx+MWjxw0Y2HAiUzJhsOdBHuo2epqyBH9jvgqiYnAuOD2GI3t89A1JkKf72Q
         PLgKooTqq8nDdZjSewyBysR8Wa2i50dEqQbJZJSB/Ko/YXfp2P/zQQjKwRbD1fDXg8Tj
         HvW1bua1ajSpXXWnpcmCos2Lz27IjDVdb2f+TWhj9pdQd2/gFg9DMytk3PAXKXfRMGl3
         sCqG7Jv+i3RODjR0fB5Af3EyM65yQ1fkZubw1ywhz6dN1caUFdK6Lcsen5WAELyUXL2j
         U3JStd/CtceHH7XgjXnxjFX0FQA06YUl6v+RpVr2MPZ8QB7VqtzuNAbGPkYwmKvitYUz
         u4Tg==
X-Gm-Message-State: APjAAAVdqbsUKvHn40wdskVuZEk+Yd8v/2bX67FCDEQOrBQtr14RndIM
        qJbJePibmW45/CeXdZhZWfd1Ng==
X-Google-Smtp-Source: APXvYqzo2zs0vFhTi4BsHGS5CCo9i5MV/q0b3Yz/vYy3NPUvt17ddgg9Ft2tIbTOfkjq3lAmeSZ2Fw==
X-Received: by 2002:a63:e044:: with SMTP id n4mr34139761pgj.338.1582231698289;
        Thu, 20 Feb 2020 12:48:18 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m12sm301955pjf.25.2020.02.20.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 12:48:17 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:48:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: sdm845: Add IMEM and PIL info
 region
Message-ID: <20200220204815.GE19352@xps15>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-6-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211005059.1377279-6-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Feb 10, 2020 at 04:50:56PM -0800, Bjorn Andersson wrote:
> Add a simple-mfd representing IMEM on SDM845 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Replace offset with reg
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d42302b8889b..3443d989976c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3018,6 +3018,19 @@ spmi_bus: spmi@c440000 {
>  			cell-index = <0>;
>  		};
>  
> +		imem@146bf000 {
> +			compatible = "syscon", "simple-mfd";
> +			reg = <0 0x146bf000 0 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible ="qcom,pil-reloc-info";

s/="/= "

> +				reg = <0x94c 200>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x80000>;
> -- 
> 2.24.0
> 
