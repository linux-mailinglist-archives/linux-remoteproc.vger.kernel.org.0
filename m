Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBDF1B61E8
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Apr 2020 19:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbgDWR0a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Apr 2020 13:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729783AbgDWR03 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Apr 2020 13:26:29 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB492C09B042
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2020 10:26:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so2785090pjb.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2020 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DpK1MTO7mSVlwfsYeufnIzC273XYT16h4tVPLSulEzc=;
        b=PSPRcaL1HUiOr023rE5B+XwN77h8gbIjK8X6Mh74KkTryaei+Vot45w0LONd32yLVu
         zlCj1BeWiuKyoSI2yHH/9jcc4rwIXhvs1DeIOYOwKMnfyG+qL4vBswh3XVvyFV6YZn8F
         SSKvIxsHeSq+xYlGIVrup6/beM54i8LXBv7O3i2OXOAqgDp5wYEnhWdDsz8TBZ+r8ZdC
         DGTPleUuXt0NpSl1Gnd56AatVnGrcRxdLn1luU35ni4mScbHsJZlds5t4BOy143Up/Sr
         iILYdeAN0U+adJ/51NYjQHOVzw0LzBUUl0t3Yc6YF0ZLn+T/0dRr+MA/3WNEp1WEJlQu
         jbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DpK1MTO7mSVlwfsYeufnIzC273XYT16h4tVPLSulEzc=;
        b=OM8ezli9zqPXqwSTsQm61F53X45+rNt+uQ1t6WTlijvM+9rNIKJ67KJ/An9LIUy+nv
         KMg5LG7Qv4Tsil/483UoAD/vcBDCJgoa0cx3W0Acql2L2g0hcLTMq3kKs72Imf8LgaQR
         IYTPKfTKKDo/xZcyHqw2oeMEQQLcqnlwJLl93V2Fl27VTkp8/MvNSy6Q2FKKHeZOMfWw
         iJLRWCYm3HkIK3gloHjq+gaM2+8kiJiC6+Xyry7BndTsbHyucaTKYkJd+V7xt+xyYGU6
         R8jTidx9sRd9EvMwjiNVnPR8cbt8mZM33fJ3z032sfY7JOjAYYT0b/evmFsf+HALa6ho
         Hosg==
X-Gm-Message-State: AGi0Pubfn96hmNuQayWtqi/GLBV1ZENSzDWbCZ9UHAZVzjktmsY1l43f
        Uvvgt5eKNQU/OnROVgQUuR+2Jg==
X-Google-Smtp-Source: APiQypLp3Z+/Yk+XGaZEB6yuRINzC6WDm70jllBSgPHmDuMXP7oj5imDwelymWaTBn9GSKEN4ay0HA==
X-Received: by 2002:a17:902:a418:: with SMTP id p24mr4970644plq.55.1587662789172;
        Thu, 23 Apr 2020 10:26:29 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f2sm2786447pju.32.2020.04.23.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:26:28 -0700 (PDT)
Date:   Thu, 23 Apr 2020 11:26:26 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RFC 00/18] remoteproc: Decorelate virtio from core
Message-ID: <20200423172626.GA5781@xps15>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 16, 2020 at 06:13:13PM +0200, Arnaud Pouliquen wrote:
> This series proposes to introduce the notion of platform device for the
> rproc virtio management. One obective is to allow virtio to declare is
> own memory resources without the usage of dma_declare_coherent_memory
> that seems deprecated since the introduction of the device tree.

Just to follow up with the rest of the community...

During the openAMP remoteproc sub-group conference call [1] Arnaud and I have agreed
the best way forward for this patchset is to split it up and make a few
adjustment that will make it easier for people to review the work.

Thanks,
Mathieu

[1]. These conference call are open to anyone who wishes to participate.

> 
> Proposal:
> - the rproc virtio is processed in a separate platform and could be handled
>   as a generic platform device.
> - Several vdev devices can be declared in DT:
>     - which allows to declare their own memory regions and answer to [1].
>     - as next steps it would be also possible to:
>        - declare their own mailboxes, rpmsg drivers, ...
>        - use dma-range to handle the pa<->da translation at virtio level
> 
> Several notions are introduced here:
> - Virtio platform registration which allows to decorelate virtio from the
>   remote proc core device. 
> - Synchronization of the child devices relying on component bind/unbind.
>   This mechanism ensures the synchronization of the child devices before
>   the boot of the remote processor and before the release of the resources
>   on the remote processor shutdown.
> - Ability to populate child devices declared in rproc device tree node.
> - Possibility to declare the memory regions reserved to a virtio devices in
>   the devicetree.
> 
> Known limitations:
> - the patchset has been tested on a st32mP1 plaform only
> - it is based on the v5.6 (need to evoluate depending on V5.7 and on going
>   patchsets).
> - The virtio memory allocation does not take into account memory
>   controllers such as IOMMU and MPU.
> 
> Arnaud Pouliquen (18):
>   remoteproc: Store resource table address in rvdev
>   remoteproc: Introduce virtio device add/remove functions in core.
>   remoteproc: Move rvdev management in rproc_virtio
>   remoteproc: Add rproc_get_by_node helper
>   remoteproc: Create platform device for vdev
>   remoteproc: Add component in core for child devices synchronization
>   remoteproc: Add component bind/unbind for virtio platform
>   remoteproc: Externalize carveout functions
>   remoteproc: Move vring management from core to virtio
>   remoteproc: Add capability to populate rproc subnode devices
>   remoteproc: Add child node component in rproc match list
>   remoteproc: Support of pre-registered virtio device
>   remoteproc: Add memory default allocator helper
>   remoteproc: Add pa to da translation API
>   remoteproc: associate memory entry to a device
>   remoteproc: Parse virtio node for memory region
>   remoteproc: stm32: add the pa to da ops.
>   ARM: dts: stm32: Declare a virtio device
> 
>  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   |  10 +
>  drivers/remoteproc/remoteproc_core.c     | 469 ++++++++++++-----------
>  drivers/remoteproc/remoteproc_internal.h |  23 +-
>  drivers/remoteproc/remoteproc_virtio.c   | 415 ++++++++++++++++++--
>  drivers/remoteproc/stm32_rproc.c         |   1 +
>  include/linux/remoteproc.h               |  27 +-
>  6 files changed, 673 insertions(+), 272 deletions(-)
> 
> -- 
> 2.17.1
> 
