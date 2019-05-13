Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56D21BD28
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 May 2019 20:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfEMS2e (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 May 2019 14:28:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42032 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfEMS2e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 May 2019 14:28:34 -0400
Received: by mail-pf1-f196.google.com with SMTP id 13so7638401pfw.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 May 2019 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lULlTV7m1pBxNEpFfsXGT5YAWHe6OnD78UhuQracLx8=;
        b=ba8z1HjqfNcfNQjKO962vacXZSrGJfjVu0a94Rx2cmEQ0Dj9bHClLAPxRIitovoLUL
         go+R0p+2WQ886PHGs9YVj6K4v936eyoIutajrb9hqAgsDZJ9WTJHtueRbJDUeHIWS7R5
         XN6BC3BFEMfgTjd+VgvJ0iBKCiaL/dfGiZ6XirafRYfXoh1777NT/CcQ5SZYEhV1y6qL
         RvgE5njVf/5gBOjDVUAF/vXjxWfDs+9tZ4ak39aqjn7aWm8ctR1eL1U8ysBphRallsPd
         nHf9xrrvYxEo6uF00XfTT81EZc2KciUMYhQ4uEZdrA5009BwxnOwwO5mncxQ/UTF2frQ
         rdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lULlTV7m1pBxNEpFfsXGT5YAWHe6OnD78UhuQracLx8=;
        b=q0QwXdriK8MPTxvGpbnL7rxAqfOVOAz2yrTFvB7BBCBl4uz0erlFrBJwqcKu0zMjgf
         6jqUqmjanRST9AQ/si0IkT5RTEnigknbkk/0tNfH8VPpte/q29WWwJSTj0dDO1oFX89i
         kJ3eJcx67G8Rg0mx59s4k40CqdooyiYTYY5EajHL3DZheWUDEYzfZ0lnyCYbEupk1Eq2
         E38RHl3pHyFoXLjNR2PjEAFU+dnFBlEAwYGQqBkuQ9M4zSvj8to4zQsuTpC3b7XtDaxl
         HBIFcXxh4ntB6tgaVCTsyW0QGvIS3kVAOPyn+CSc9N4Ky6U9Gfa/2c7S8YqsIvJyCWTs
         4JIQ==
X-Gm-Message-State: APjAAAVwAMKcmjDqdwHzDlnNdim1PaU9EmuQeP3K3RnFD3f8qWTSHuNO
        vk9Rt3DPiaN2qrllQ9GJLVwgVojz6+k=
X-Google-Smtp-Source: APXvYqyyRyX/Z1Ftzu6C+Ft3g/y3kRv4J5edtr6lSayFN26x2cJKgLsUkqLQAty3g5bhEFF2jBUONg==
X-Received: by 2002:a63:6b41:: with SMTP id g62mr21612026pgc.240.1557772113010;
        Mon, 13 May 2019 11:28:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r124sm15257455pgr.91.2019.05.13.11.28.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 11:28:32 -0700 (PDT)
Date:   Mon, 13 May 2019 11:28:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: qcs404: Define APPS IOMMU
Message-ID: <20190513182853.GI2085@tuxbook-pro>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
 <20190510043421.31393-8-bjorn.andersson@linaro.org>
 <20190513045402.GA2707@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513045402.GA2707@vkoul-mobl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun 12 May 21:54 PDT 2019, Vinod Koul wrote:

> On 09-05-19, 21:34, Bjorn Andersson wrote:
> > The APPS IOMMU provides contexts for FastRPC, MDP and WLAN, among other
> > things.  Define these. We use the qcom_iommu binding because the
>         ^^^
> Double spaces crept in..
> 

That's to give you some breathing room while reading it - but not as
much as a new paragraph :)

> > firmware restrictions in incompatible with the arm-smmu.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 85 ++++++++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index b213f6acad76..fcde4f0334c2 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -378,6 +378,91 @@
> >  			reg = <0x01937000 0x25000>;
> >  		};
> >  
> > +		apps_iommu: iommu@1e20000 {
> > +			compatible = "qcom,qcs404-iommu", "qcom,msm-iommu-v1";
> 
> Did we define qcom,qcs404-iommu in bindings, It does not seem to be
> there in this patch, next or integration one
> 

No, this was entirely intended to fall back on the generic compatible.

That said, further testing of this series indicates that we have a
cache issue related to the SMMU. In working out this I came up with a
series of patches to the arm-smmu driver that allow us to use this with
the standard Qualcomm bootloader.

So let's ignore patch 7 and 8 in this series until we know how to deal
with the SMMU.

Regards,
Bjorn
