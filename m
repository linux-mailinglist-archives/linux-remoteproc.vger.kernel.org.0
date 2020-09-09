Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F85263736
	for <lists+linux-remoteproc@lfdr.de>; Wed,  9 Sep 2020 22:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIIUTa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 9 Sep 2020 16:19:30 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42941 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIIUT3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Sep 2020 16:19:29 -0400
Received: by mail-io1-f67.google.com with SMTP id u6so4595334iow.9;
        Wed, 09 Sep 2020 13:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RSxhAGvdVfCVr2cHc0lTJnW3lYIHBFlEXCul1r62/7Y=;
        b=ATB16xGzDrbixiGqqK/4XYtJEDyZN+q1tBiVf0ZF+60wEwO0vHXPCpZqQF4/+54pML
         o/a3s5nPkdkc0cNNxl3BF8q8rWcIxyemCn9w5D9UkMOrkfVaGcGKVM6XnGUkzkLMbGxC
         7LrG1LK9SfFey2ZLIdq8WzbPjByVTBHChUfGbuXKywPHsG/7n1k7Pj2BghOOuQ2BosQm
         e0TUic2N77/Be6z24D8mpPYJ28zYyLCPZd0+iUHGEJHOgI3iYItl2LGIN9wkRYVVhYm2
         qMvTpkTkcWNt08hK9h1rTC1CVGHpAunH4cXe1UbIITW2gyH9F/YbkqHpD/NRS3GIioaj
         7/VQ==
X-Gm-Message-State: AOAM532Uw58e16Cyq9uczvv5djZLTfP2RN1oUUnzzZOZ/5XXgWIXo74s
        Ns0L6j1qyqrQoTdrSsCAAQ==
X-Google-Smtp-Source: ABdhPJwBKiVRr3c97gG/LCzkZs5UuOnxWgLTDtzzXrRD6aV8r7ZtsBq+rZPDQ3q6pulT0cX9C8fw0Q==
X-Received: by 2002:a6b:9309:: with SMTP id v9mr5087885iod.15.1599682768674;
        Wed, 09 Sep 2020 13:19:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u89sm2049917ili.63.2020.09.09.13.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 13:19:27 -0700 (PDT)
Received: (nullmailer pid 2974124 invoked by uid 1000);
        Wed, 09 Sep 2020 20:19:20 -0000
Date:   Wed, 9 Sep 2020 14:19:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Fabien Dessenne <fabien.dessenne@st.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: stm32: Add compatible for syscon
 tamp node
Message-ID: <20200909201920.GA2973966@bogus>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-2-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827072101.26588-2-arnaud.pouliquen@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 27 Aug 2020 09:20:59 +0200, Arnaud Pouliquen wrote:
> Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
> more specific compatible")
> It is required to provide at least 2 compatibles string for syscon node.
> This patch documents the new compatible for stm32 SoC to support
> TAMP registers access.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
