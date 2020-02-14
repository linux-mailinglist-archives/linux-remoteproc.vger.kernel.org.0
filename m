Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F4A15D12C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Feb 2020 05:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBNEkr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Feb 2020 23:40:47 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52483 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbgBNEkr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Feb 2020 23:40:47 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so3339150pjb.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Feb 2020 20:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mV/b33fX5O4Uwlfl3Gd/C2A6H9eBURl2CC4vnB/ScUc=;
        b=tNql3Xx0EqLiFHTw2SWEKNybEhJdG+p7J80PZC/SlxQOgfhCwbpJvm6gGvw7xXLE+z
         tRxTDxYV7xMdkQQbIble7Q5f15aYj7ZYmzNdxpCFCcj/uDKbXSyhyQkuTNeZpQUQB+a+
         /NDIFnTDn+P2UjPOMCdBKaA+WCrRPN5EvJtYtpQPLV3BRXR8aBZNXPJZ2FxYKyrFaO1T
         ou8x6FBKclpbx7Ra18Z1ke6M+TCSsc5h3MkJRXCdYbrDI9IEq6Wfj/sR4xMoiWQmAw5r
         0J6iYMaZDKBfPNYnrkwpnsb1wC861ESMf4TyQXT2fIUBXOuQifowBF3KMDQWru7uJW8c
         RW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mV/b33fX5O4Uwlfl3Gd/C2A6H9eBURl2CC4vnB/ScUc=;
        b=AWF0kprCp+y8gYMZR+WBPbup8ocmSuKXB+cIhbWE6iKzaFDlQMEddy7BKOOLQl610a
         T4dD4dHn6XDsswbgDGUCT0L4yG/Yj/NmvH2pjt6X25U0TQUwbF8tjjfow2xGIYHV1jE2
         HAAv0G7Qh+71McCLKLa5Dv6DAj4cqDypkVyqmoEtjyE/1kkA6fFH2keuGUbaavrMV4oW
         XCKQL8GUwFjazLnTSqcQKUk1ykm6RDUxMNmZiyphOPXIUbrd3G7QlUUzSyxe80qU5OCi
         XLQGXEWqcX1Q9Pzkad2NetzS1/TOxoaMwK/RiLNum4fvQXbGfccJBlfCvQA0QjcF/j6I
         djRw==
X-Gm-Message-State: APjAAAWl6QFhbbmd/6MBD8dDp35c15hvFWwO9eoJ0CYyoBrslZ3EPlnH
        mIG0F3aF/J3L1Hjc4OPHm5kkkg==
X-Google-Smtp-Source: APXvYqz4yePjmRoZNJimpJatSM40lC1fahi/dq1Wsa5+Jjr0X1Ix7F87Vn/cAZoldoHg6njMODPAFQ==
X-Received: by 2002:a17:902:a608:: with SMTP id u8mr1407814plq.76.1581655246497;
        Thu, 13 Feb 2020 20:40:46 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i6sm4928463pgm.93.2020.02.13.20.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:40:45 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:40:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info
 region
Message-ID: <20200214044043.GS3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-5-bjorn.andersson@linaro.org>
 <158164782444.184098.15673002519472990390@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164782444.184098.15673002519472990390@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 13 Feb 18:37 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-02-10 16:50:55)
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index 4ee1e3d5f123..f539293b875c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
> >                         status = "disabled";
> >                 };
> >  
> > +               imem@8600000 {
> > +                       compatible = "syscon", "simple-mfd";
> > +                       reg = <0x08600000 0x1000>;
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       pil-reloc@94c {
> > +                               compatible ="qcom,pil-reloc-info";
> > +                               reg = <0x94c 200>;
> 
> Is it 200 in decimal? It looks weird that this is basically the only
> thing that isn't in hexadecimal.
> 

Yes it is and the size was documented as such... But you're probably not
the last one who will spend cycles wondering if I forgot the 0x.

Regards,
Bjorn

> > +                       };
> > +               };
> > +
