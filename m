Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C9F5BD74F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 20 Sep 2022 00:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiISWad (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 19 Sep 2022 18:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiISWac (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 18:30:32 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CCD419A3
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:30:31 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a80so988772pfa.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6BkRaoihLoEElFg+IX7ChAv0K/VTWRTZJq+3zEWaWR4=;
        b=zJ+koiUbsBA6nsMsJVF32pKjvNy/kMK5rlMM1FsSNse5e3DSA7Y0SsJg8C2OBi5OQ0
         3CKkyobH21cMqvQlYFDGv9e+YyEQWF5j8/Aw+WU914rB1eX8PgxfExDMHYwhRf0mYzho
         QEMzMU87Vm8m79L82Rcwh7xbBasJF+O2QSjDrn/2QZEeXdQ2BiPAV2sxQuQduHI9Mf0k
         oKcLshk7Cqur2Z2v9BkbuG2jaCogpWoX/89bGPxZbfhjyTavclkkAEnFfpcG65AexljC
         wzXFwxPO0Yj/e4pDOYNljWwfkNHcDR1+fQ5SZvc3L09RO0wjd/UH1RpuboRJfKkCDCd7
         3B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6BkRaoihLoEElFg+IX7ChAv0K/VTWRTZJq+3zEWaWR4=;
        b=2oYkSU29GhWUXLeR+GiGTcQ1koEQNQxz49aKNdQbC/PtrCu6+qNOzEoabK+VRs8qVR
         KE5DC5xwrnhAN8KIAIBArUmH0W2CQqzhPle/HHLHy1RD2CmaPhAm7hcaIC0sM5hGnbyq
         Dp2xbxxXkgibV12zIIWFh2hoKoDF5byZjvHoKy1zOVf/IA3h+LS2x8lw0HiMbg3CywUM
         sxcKZBfV4z92hncOcid9ck3PpJtBRP+sWXYok1vvSQJUh6WKBv5iPJ5TTjkF5PghsCpy
         m/aE/X00C/QAR1HIAWpyyxLiZAsHDGc4ZEjUpvuTbXUN+BE+RVvaM8nLaJLNwoGFBKsM
         DghA==
X-Gm-Message-State: ACrzQf06l7Hif3OUVKaDS72+dXe756YvbLUb0mK9Q9Q7uqPC/t0zbRI1
        OUMCj6fplSXpWPNPVblMC4cTE6TNESSKjg==
X-Google-Smtp-Source: AMsMyM4OPn0S8DVKRo7cq8RhXwQfQL8LATxgVZWL84rVh41CP+oZh/QYqjWbOhyCP3zwiN7oUNwaZw==
X-Received: by 2002:a05:6a00:1309:b0:535:d421:1347 with SMTP id j9-20020a056a00130900b00535d4211347mr20818684pfu.5.1663626631115;
        Mon, 19 Sep 2022 15:30:31 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902da9000b0016dbdf7b97bsm21143620plx.266.2022.09.19.15.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 15:30:29 -0700 (PDT)
Date:   Mon, 19 Sep 2022 16:30:27 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [PATCH v8 0/4] remoteproc: restructure the remoteproc VirtIO
 device
Message-ID: <20220919223027.GG759648@p14s>
References: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Fri, Aug 26, 2022 at 01:52:28PM +0200, Arnaud Pouliquen wrote:
> 1) Update from V7 [1]:
> 
> - rebase on rproc-next branch [2], commit 729c16326b7f ("remoteproc: imx_dsp_rproc: fix argument 2 of rproc_mem_entry_init")
>   The updates take into account the integration of the
>   commit 1404acbb7f68 ("remoteproc: Fix dma_mem leak after rproc_shutdown")
> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> according to reviews on V7
> 
> 
> [1] https://lkml.org/lkml/2022/7/13/663
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next
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

I was in the process of applying this set when the last patch gave me a
checkpatch warning about "virtio,rproc" not being documented.

I suggest to introduce a new "virtio-rproc.yaml" based on this work[1], with the
above in the example sections.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.0-rc6/source/Documentation/devicetree/bindings/virtio/virtio-device.yaml


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
> 
> -- 
> 2.24.3
> 
