Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9B25C052E
	for <lists+linux-remoteproc@lfdr.de>; Wed, 21 Sep 2022 19:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiIURRe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 21 Sep 2022 13:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiIURRe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 13:17:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130F79E691
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 10:17:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso6587628pjm.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gwqmC4NuHafj5NpjpfTWwfVlcLnp7YqgtXIYrZ8UvIU=;
        b=PiiyhcsWQFqUxuCDeFfp2lk9KFrX/5bsq/SThAtJAJJeNPohQT8R4aPO9yE3ANREP5
         FPI4EdUTTSZTbWChu4N4TkBqgoh5nAcrgHsoSZkxUscYLzH7zRJwBdNROG7kiwjaVHKr
         hz9Mw8e2R/+oJshVcYB1OfqTDMfSjLkhb+2EjerXVfQPMa6TPbfcH5ZS88G3yU7aSLb+
         cx2SSvmgbl1TrDM6o1UKLUsi9dOJAw2Shp9yWFvIcoIq0vFFC1owuYa8SohYqmSmuhx2
         SbzSKywgpC+/qoeTpHsk7ELOPyOsI2WY0kjafJDxpzbrmtSkZ2Pf0uUlNd37yyA5s93W
         TuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gwqmC4NuHafj5NpjpfTWwfVlcLnp7YqgtXIYrZ8UvIU=;
        b=M3tbQsWt/gL3VxEl+DVLEEv8ZLZ5cGuJFyUKYnZA7uSmnkAXIe8n+u4mdEvv4Jvc2E
         YdPEO1rkW18f1cGbKGLNkRoAeTr6b47Sl/hHC9eMnicGMPNaUuMQ2FVoyA9Yc0IgqI8M
         7c5lcZsO8iKnA7VwvIW+NL2zt7d2cY/Golxh9HhuAtFxF3E8oOQcCYQjuAFSWKkNxfgD
         N7MMhaWehZxaala+9M7QjRRSRuXvGA5b+/BIP5AwQztoN39ufgwrKuZzU4l6ebVwg3ek
         QyMm3E6auzoGWHDGAsfWG6KPeJGo/gpnIiiCBgoUnkSbN+09CEYfsOh9BIE7wP6vfocB
         9mKg==
X-Gm-Message-State: ACrzQf1Yh322QEunXtOhpAI7gsVDDPcPOsi496rlH/lk9eCDT6xGp2S+
        EwJx8iKW2eIIblmL5MBrhH/89g==
X-Google-Smtp-Source: AMsMyM6HjQC0QJUFVRU0D109G/8mdTe39kBwFGdqjBEKgxhohkXgiJ1Efms3jEjlBFGKmITF60u2KQ==
X-Received: by 2002:a17:902:f606:b0:172:6522:4bfc with SMTP id n6-20020a170902f60600b0017265224bfcmr5674724plg.133.1663780652546;
        Wed, 21 Sep 2022 10:17:32 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e22-20020a656496000000b0043be00f867fsm2123650pgv.60.2022.09.21.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 10:17:28 -0700 (PDT)
Date:   Wed, 21 Sep 2022 11:17:26 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [PATCH v9 0/4] remoteproc: restructure the remoteproc VirtIO
 device
Message-ID: <20220921171726.GA1126145@p14s>
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 21, 2022 at 03:50:40PM +0200, Arnaud Pouliquen wrote:
> 1) Update from V8 [1]:
> 
> - rebase on for-next branch [2], to apply series on top of commit
>  7d7f8fe4e399 ("remoteproc: Harden rproc_handle_vdev() against integer overflow")
> 
> [1] https://lkml.org/lkml/2022/8/26/532
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?h=for-next&id=c81b67199cc4e2e4e8caf1abbbca1dc1b80bc642
> 
> 2) Patchset description:
> 
> This series is a part of the work initiated a long time ago in 
> the series "remoteproc: Decorelate virtio from core"[3]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT
>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.
> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing [4][5]
> 
> [3] https://lkml.org/lkml/2020/4/16/1817
> [4] https://lkml.org/lkml/2021/6/23/607
> [5] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
> 
> In term of device tree this would result in such hierarchy (stm32mp1 example with 2 virtio RPMSG):
> 
> 	m4_rproc: m4@10000000 {
> 		compatible = "st,stm32mp1-m4";
> 		reg = <0x10000000 0x40000>,
> 		      <0x30000000 0x40000>,
> 		      <0x38000000 0x10000>;
>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>         mboxes = <&ipcc 2>, <&ipcc 3>;
>         mbox-names = "shutdown", "detach";
>         status = "okay";
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
>         
>         vdev@0 {
> 		compatible = "rproc-virtio";
> 		reg = <0>;
> 		virtio,id = <7>;  /* RPMSG */
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> 
>         vdev@1 {
> 		compatible = "rproc-virtio";
> 		reg = <1>;
> 		virtio,id = <7>;  /*RPMSG */
> 		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> };
> 
> I have divided the work in 4 steps to simplify the review, This series implements only
> the step 1:
> step 1: Redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
> step 2: Add possibility to declare and probe a VirtIO sub node
>   - VirtIO bindings declaration,
>   - multi DT VirtIO devices support,
>   - introduction of a remote proc virtio bind device mechanism ,
> => https://github.com/arnopo/linux/commits/step2-virtio-in-DT
> step 3: Add memory declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step3-virtio-memories
> step 4: Add mailbox declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step4-virtio-mailboxes
> 
> Arnaud Pouliquen (4):
>   remoteproc: core: Introduce rproc_rvdev_add_device function
>   remoteproc: core: Introduce rproc_add_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 189 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 210 insertions(+), 162 deletions(-)

Applied

Thanks,
Mathieu

> 
> -- 
> 2.24.3
> 
