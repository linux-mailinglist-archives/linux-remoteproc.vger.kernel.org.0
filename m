Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984D14A8B70
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Feb 2022 19:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345390AbiBCSUF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 3 Feb 2022 13:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353340AbiBCSUF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Feb 2022 13:20:05 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E430DC061714
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Feb 2022 10:20:04 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id n6-20020a9d6f06000000b005a0750019a7so3284669otq.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Feb 2022 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FCGv/qYKeyIfFckxFA2H8QoH1f78f7u1cBQ9C1Sjl3M=;
        b=eF5N1ay0x01zbCkcH51YulCjlbhEz3kuA1OuFLPpYD06veDb//xhGfkMg66RE1E7cM
         RXivflDbMlN/+L96DUHKvaL/WzBE+5OQwylRvm5Nr8Nz6bfZHtBrn51QRqndqNBUOqmY
         XNLOYbDTOC6rIydYZgoJWdk7zx8nzbetY1GzohlLLRh+VqdnKO6TqsPQT8nqZ9YJ4FWq
         ibNHoEZ3MyBsTJVKaIfyZlHW/zHh5dOnWTgg9YcNZdDdHUc+v/thpYW5HfkanOU7QYxZ
         5vWVO5umEUNLp4nbmCXz1wcRoutZfkOM/wN48fx/yQ97mmaWp7h9qb0GIJ9VVhig+9WE
         KL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FCGv/qYKeyIfFckxFA2H8QoH1f78f7u1cBQ9C1Sjl3M=;
        b=JIaUDIFWxzpqqfIzXTPKz66PgZCgwlYxggKr1YN/uQ6XQw/rIKGjvFXfME9LgWKgg1
         LJJ1jUuz8VNPHWfG8aPF1+/kFr0qHrOKDLP1oJbS/dNK7i5V7Qq56MIDXhNiBLiPc310
         9/eudb33anI7irqtltdYji/wh4SozCMmt6b7+rs9Hl/gjjF23epdxF6gf6PnZS6tj7Gb
         7XeNLX5s2zT5dWqmum4SLgsg26K1IiS7bUpjbZRUJ3wjtWNee7g9ApCIQ6CgODbnddbm
         K3n1bAUWTBWS3fIaCXx53A12f4sF1bsm7eRZ8g3GRRTaDpoOglFjz/tUR+NUeGkwmhft
         6mmQ==
X-Gm-Message-State: AOAM533W9A8UrBHZpq/tSxxjZwsRbFHD5FFRQUJyM6b32xvXULSbQenb
        Sr7nHML2OUiqfbBEn45PUuD3Dg==
X-Google-Smtp-Source: ABdhPJwIMo1ObNoIxykn8Wni8kH14hmmZ6CyaP0CsL8r060Q8Mrt4EjdgnqBRcqUNAj85m5E+K8NOQ==
X-Received: by 2002:a05:6830:42:: with SMTP id d2mr19692222otp.27.1643912404228;
        Thu, 03 Feb 2022 10:20:04 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r186sm13107645oie.23.2022.02.03.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 10:20:03 -0800 (PST)
Date:   Thu, 3 Feb 2022 10:20:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] soc: qcom: mdt_loader: Support Qualcomm SM8450
Message-ID: <Yfwc5NG2sB5LNWut@ripper>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
 <8ee1cea3-00f3-7a9c-dbd9-aaf8160db006@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ee1cea3-00f3-7a9c-dbd9-aaf8160db006@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 03 Feb 07:11 PST 2022, Dmitry Baryshkov wrote:

> On 28/01/2022 05:55, Bjorn Andersson wrote:
> > The Qualcomm SM8450 platform comes with both some smaller changes in the
> > firmware packaging and a new requirement to hold onto the metadata buffer until
> > PAS auth_and_reset has been completed.
> > 
> > Extend the PAS api and rework the mdt_loader to meet these new requirements,
> > then wire this up with the PAS remoteproc driver and finally add the SM8450
> > remoteproc instances.
> > 
> > Bjorn Andersson (13):
> >    firmware: qcom: scm: Introduce pas_metadata context
> >    soc: qcom: mdt_loader: Split out split-file-loader
> >    soc: qcom: mdt_loader: Allow hash segment to be split out
> >    soc: qcom: mdt_loader: Allow hash to reside in any segment
> >    soc: qcom: mdt_loader: Extend check for split firmware
> >    soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
> >    soc: qcom: mdt_loader: Always invoke PAS mem_setup
> >    soc: qcom: mdt_loader: Extract PAS operations
> >    remoteproc: qcom: pas: Carry PAS metadata context
> >    dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
> >    remoteproc: qcom: pas: Add SM8450 remoteproc support
> >    arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
> >    arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Thanks.

> Minor nitpicks:
>  - I'd reorder the series by moving patch 1 (pas_metadata) closer to patch
> 8&9 (pas metadata usage)

For a while the design where such that I would merge the first patch
into a immutable branch and then merge the soc/qcom and remoteproc
changes separately.

But as you can see, in the end the remoteproc patch ended up depending
on the mdt_loader changes.

I like your suggestion, so I can move the scm change down to keep things
together.

>  - I would have added pas_metadata as an argument to qcom_mdt_load().
> However I see, why you didn't want to add another argument to the list.
> 

I looked at that, but I was already unhappy with the argument explosion
in that function prototype.

By splitting out the difference between qcom_mdt_load() and
qcom_mdt_load_no_init() into a separate function will allow some cleanup
and better reuse in the client drivers.

As we bring up the various clients on SM8450 we will need to perform the
same modifications that was done to the remoteproc driver, by doing it
like this we don't need to change the prototype twice.

Regards,
Bjorn

> > 
> >   .../bindings/remoteproc/qcom,adsp.yaml        |  16 +
> >   arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  20 ++
> >   arch/arm64/boot/dts/qcom/sm8450.dtsi          | 297 ++++++++++++++++++
> >   drivers/firmware/qcom_scm.c                   |  39 ++-
> >   drivers/remoteproc/qcom_q6v5_mss.c            |   7 +-
> >   drivers/remoteproc/qcom_q6v5_pas.c            |  36 ++-
> >   drivers/soc/qcom/mdt_loader.c                 | 232 +++++++++-----
> >   include/linux/qcom_scm.h                      |  10 +-
> >   include/linux/soc/qcom/mdt_loader.h           |  17 +-
> >   9 files changed, 579 insertions(+), 95 deletions(-)
> > 
> 
> 
> -- 
> With best wishes
> Dmitry
