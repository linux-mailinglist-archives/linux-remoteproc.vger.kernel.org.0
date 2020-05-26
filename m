Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7730A1CBAB5
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 May 2020 00:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgEHW1P (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 May 2020 18:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727787AbgEHW1O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 May 2020 18:27:14 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E27C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2020 15:27:14 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id i19so3358177ioh.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2020 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vle6I6fdCR+MgLWGv8JrPtPNfXU53mZx6L1pAHaqj1g=;
        b=V843ea6ESg1x21Y6+gTjFBY0MV989R+qKt+LdVEmhVpIz91aJMmiflg2BAp0S88GUV
         1INgZt1g72jgtvnQvVSRKwpED9U1EFNWGHCFzWeQ3JaW+FAzuzDK9QhRMu8QMeXz7V95
         wLeJmHkHf7c2u683yKlTCnJtRG01hbD3tYDO48cc6xXEawWUHduJXTmQ52nX2gx0z6xk
         eJcv5XPytWPVGLE8VbxpzCwkSQ/CjiSZIkN3jqobql1mBAUPZ6HCYPOzU7wymQcGVt8W
         4jcWsF+ZAtHJS49l1bmrg/yTkgNDrapQltT0g8NwpSz55x7nvYwPdvssUjq1AOSbMjYA
         Lwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vle6I6fdCR+MgLWGv8JrPtPNfXU53mZx6L1pAHaqj1g=;
        b=mtOp5L9ygt5gg8FK785ICq/u6ck441FhJWlR+QZEZ5YvROAPFeSIDjvuR+ReQU0jEA
         Ft0aMIGupgjUTN90AW1Fk/1j49sJ/GSqEsPScTk8sOva6J7FCWIBUYIByYtVlQd0ytCv
         6r/kW2Mx6q07L0LbOZ/fAZFPOsWYf++ThCAvG9lxdUDDiqorWhrjmgHdRn2C2Z6PkusT
         T5WmQj3gUIEh37L1Sc5E2Rvj7Alyt1mG7sUFySAMMfDS7/tBe6IbcVEfvHAjCcu7FDZ2
         1qP68rdWD9PgJuMmrWyDW/xBLK3VArU4MitH2WXuMFw+/MOD+AcKJzR3/uC9vgJ9MA23
         X0yQ==
X-Gm-Message-State: AGi0PuZhEllzXOS39nhf7tFuzsWWWh5tKWzwXqaxeHEofuz93trI7WCn
        vN/5C7rhEYoxHWBq8dDPsvo6VuhGe65Y20UkdzQKRw==
X-Google-Smtp-Source: APiQypK80T14lZ+yTq0Yv7MsY9Tajr69Yl/r5H646/JxI/XctxB/azG3DHLQDj81TzoJNJvsCSSa+UKmKnxxaL1LRmg=
X-Received: by 2002:a02:2708:: with SMTP id g8mr4935476jaa.52.1588976833756;
 Fri, 08 May 2020 15:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200420160600.10467-1-s-anna@ti.com> <20200420160600.10467-2-s-anna@ti.com>
In-Reply-To: <20200420160600.10467-2-s-anna@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 8 May 2020 16:27:02 -0600
Message-ID: <CANLsYkwirm2SJoZM9T=VTZAG8iV77PC3ag0AkLbRwf1O84ai_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] remoteproc: Fall back to using parent memory pool
 if no dedicated available
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 20 Apr 2020 at 10:07, Suman Anna <s-anna@ti.com> wrote:
>
> From: Tero Kristo <t-kristo@ti.com>
>
> In some cases, like with OMAP remoteproc, we are not creating dedicated
> memory pool for the virtio device. Instead, we use the same memory pool
> for all shared memories. The current virtio memory pool handling forces
> a split between these two, as a separate device is created for it,
> causing memory to be allocated from bad location if the dedicated pool
> is not available. Fix this by falling back to using the parent device
> memory pool if dedicated is not available.
>
> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> ---
> v3:
>  - Go back to v1 logic (removed the vdevbuf_mem_id variable added in v2)
>  - Revised the comment to remove references to vdevbuf_mem_id
>  - Capitalize the patch header
> v2: https://patchwork.kernel.org/patch/11447651/
>
>  drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index e61d738d9b47..44187fe43677 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -376,6 +376,18 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>                                 goto out;
>                         }
>                 }
> +       } else {
> +               struct device_node *np = rproc->dev.parent->of_node;
> +
> +               /*
> +                * If we don't have dedicated buffer, just attempt to re-assign
> +                * the reserved memory from our parent. A default memory-region
> +                * at index 0 from the parent's memory-regions is assigned for
> +                * the rvdev dev to allocate from. Failure is non-critical and
> +                * the allocations will fall back to global pools, so don't
> +                * check return value either.
> +                */
> +               of_reserved_mem_device_init_by_idx(dev, np, 0);
>         }
>
>         /* Allocate virtio device */
> --
> 2.26.0
>
