Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69ACF121F62
	for <lists+linux-remoteproc@lfdr.de>; Tue, 17 Dec 2019 01:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfLQATj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 16 Dec 2019 19:19:39 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35756 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfLQATi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Dec 2019 19:19:38 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so4656766pgk.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Dec 2019 16:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kSRMyRpGvN3O6oC2QK8ni8ozT+CBlR4DXsbN2O0RLUk=;
        b=jVLsVcL+tDd05VMnMqEWC/RH3jR0TeoTexR/4Jp2JrT+81wvxprdmBRSkjDT0WzRj0
         FzbLjkNZd3Rn4xsNLWoTL1V6hMYsyhe8B4EiSzpCNe15QVAkXANDcy9S92SWBOJJnf92
         vQsJn/wV4V4vE061RMljzuH4Nmq8rsIDc3HLVZwjKoEU+9tEivqbB4gPHd9iQXjsyZ/7
         XsRLQhIeddKOKft6IbM9eT1jU4E+WOBAOE0ATVQzW8TgBy6XqNzk2p8UIlgXi//DO6wb
         u3D9XdBLWkWpqS6xcgzVtZIvL0RVVVNdBlzeamMC/kzKBNxSDTJVLWQ6nXxCjR2VqJjA
         N/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kSRMyRpGvN3O6oC2QK8ni8ozT+CBlR4DXsbN2O0RLUk=;
        b=EdBaj+VnL3GqeF71+syxBLhvRB56louQEGQ3hwUMRa13tsEsQ4nHPx6AVumgnop9uD
         KO83AezUpjffJ62IyUs2myQ02ayM3azYb1uGpLy3Ne8TMDMZTMrz5FrLU2y/xw2EeCK+
         oCGHLEIqkUz8ENntsRdcUVq350XOnGnGOEsd6c5ddZrzDvqM+NIlhugmFUvs32KGY4H/
         Wj9s15J0x+FBJhS50vyn9wBVJgBybuI2Qhm9TmYojZAE0jlrgD7ijB9N8Gt1uao4RWRt
         M7aoqpjBJC9vxdcXm45d3yn5q/icR3YtY/SXp27YBAWa2yFwJStVsvi9rEXQkGNwXh1G
         CfEQ==
X-Gm-Message-State: APjAAAWj9oU3rKWVLaoQq9QdMr4XVbW028iRwd2IItBqyR9vX5FQFXjM
        Hre+AoA/pSB99Yo1pEY0FsVVhw==
X-Google-Smtp-Source: APXvYqzGZHGPHjW1ue1HrbvnzOPYObbsplWRfg2TIsKHZ0VTBST/SlVCZt6iaZb64cWODmXhxvakmQ==
X-Received: by 2002:a62:2ad5:: with SMTP id q204mr7061373pfq.33.1576541977891;
        Mon, 16 Dec 2019 16:19:37 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d38sm21816480pgd.59.2019.12.16.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 16:19:36 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:19:34 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca,
        ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH 16/16] arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and
 SLPI remoteprocs
Message-ID: <20191217001934.GT3143381@builder>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80794e1d-7c9ce825-6ba5-479e-bc98-f5d56ce6933f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e80794e1d-7c9ce825-6ba5-479e-bc98-f5d56ce6933f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 18 Nov 13:44 PST 2019, Sibi Sankar wrote:

> Add ADSP, CDSP, MPSS and SLPI device tree nodes for SM8150 SoC.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  12 +++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 135 ++++++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index aa5de42fcae45..4d9bb8145dbba 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -348,6 +348,18 @@
>  	};
>  };
>  
> +&adsp_pas {
> +	status = "okay";
> +};
> +
> +&cdsp_pas {
> +	status = "okay";
> +};
> +
> +&slpi_pas {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 98a96fd1d6117..58f4ce95bd966 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -278,6 +280,139 @@
>  		};
>  	};
>  
> +	adsp_pas: remoteproc-adsp {

Please move this in under /soc, name it "remoteproc" and slap a reg = <>
on it. Even if qcom,*-pas doesn't use the information I find it look
better in the DT and it becomes more consistent between PAS and non-PAS
targets.

Regards,
Bjorn
