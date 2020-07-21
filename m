Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C882275A3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Jul 2020 04:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGUCcK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Jul 2020 22:32:10 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40619 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGUCcK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Jul 2020 22:32:10 -0400
Received: by mail-io1-f68.google.com with SMTP id l17so19739030iok.7;
        Mon, 20 Jul 2020 19:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qrdcjj2nHxAqxaq8zMEhvLyNPJU48e0pDNvgfCYM2C0=;
        b=t0shBt1KQFUdUfrYVnHmcl8nysld07EWt3sAOlsus9NKz+B25eO/OzFbvAk0B9h66L
         I97fy+xLCH1m/3jUQvCx6ARZTTjC+1J2u/vDx1z6tnHfCrRZ7hPRdF1eY2EYGDxpvA5E
         0G3MIdOjXzIyWyOSlRz/o0GwKaFJz6AiQJ0XX4YCvAIU5MxqZLVlBcOIvb7QciR87PXv
         x2hHVW4Jcdli5v/mOtOrVbvwaQNlh17gOSRGl77XDaX0tpVJM1dkx9jKikpbYrFbG0Kl
         6y2SfK/ZHd7+egGEgDYwVbAd0aKHshRTEeWtFdsC56tXPp0ZmlyjOp4CLuFWuPbzBhRo
         vOTg==
X-Gm-Message-State: AOAM532gQ95WliqSOYPbdJuXOFxnSXbBADRT1uB8/Ldb8Nx0tI2u7OpS
        y5WyC1SqdeIfCuKgSC9c2A==
X-Google-Smtp-Source: ABdhPJzd57MjAeiAqZutfR+baotVYeTni73NBMMTPgbv4b8i/902OmUHR6Giu4dozlXXNTJ2jlKWkw==
X-Received: by 2002:a02:c88c:: with SMTP id m12mr15372105jao.2.1595298729038;
        Mon, 20 Jul 2020 19:32:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u65sm9676595iod.45.2020.07.20.19.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:32:08 -0700 (PDT)
Received: (nullmailer pid 3418991 invoked by uid 1000);
        Tue, 21 Jul 2020 02:32:07 -0000
Date:   Mon, 20 Jul 2020 20:32:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/6] dt-bindings: remoteproc: Add common TI SCI rproc
 bindings
Message-ID: <20200721023207.GA3418873@bogus>
References: <20200717234800.9423-1-s-anna@ti.com>
 <20200717234800.9423-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717234800.9423-4-s-anna@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Jul 2020 18:47:57 -0500, Suman Anna wrote:
> Add a bindings document that lists the common TI SCI properties
> used by the K3 R5F and DSP remoteproc devices.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v4: Addressed both of Rob's review comments on ti,sci-proc-ids property
> v3: https://patchwork.kernel.org/patch/11602317/
> 
>  .../bindings/remoteproc/ti,k3-sci-proc.yaml   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-sci-proc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
