Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC915405DF9
	for <lists+linux-remoteproc@lfdr.de>; Thu,  9 Sep 2021 22:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344009AbhIIUYf (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 9 Sep 2021 16:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343998AbhIIUYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Sep 2021 16:24:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB34C061574
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Sep 2021 13:23:24 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so2459088wmi.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Sep 2021 13:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hY9cVDnQ9Sjc0TjO+9qEkskm3/AdxrBljV6BEMKcDlM=;
        b=BLgrFVI+L7xFGagya5o45sZBcXtuNZnPp57KgWq0lxxxgzxqTHR2a22QOWn86swyqX
         INJq9JFR0DX8kmlYp0wViFnhOEKwWGem4DGSdO/wm8MTIEleuYojToGVZhMMqjhNH+45
         xpFi+qZSO/zevovxcl2SHmuN8dIPGClfIuL4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hY9cVDnQ9Sjc0TjO+9qEkskm3/AdxrBljV6BEMKcDlM=;
        b=N6a7MA/hcwJ43mhXcfmY9vhgjdUCFNPJ/M2lRsxx8VRhR/9Zz+FB8W9G6AndL7mBdZ
         V3Pd7WJbe95BhTKZCsv1PBxIKmHE9COIBg8Ecc59j68U3IzwvPyqGe7WHpaClo0EHUT7
         RiWfRqcrvmEMslLs+FoPwyyDVdeJevvqWAY/tPaUG2cvr3LkIN2PzFXltf6zMwpneQF/
         CeCptoo4NtVTmiraafhRPTnxePUOeRfeAQv0Zq6K3hOzHKbWkpAd7XBRqMcaU/bqNRrw
         fGPMlSLL8PP5lUJm+DEIzxBi2I6jTPawYOLvYhb+qquQBY8FcKQaHzRY/tKSvY5H0L2Z
         HPDw==
X-Gm-Message-State: AOAM530Zf5WwIvTHNYyuo/hCWXEvYZpsWGoJp7U266fWm3iFXvzj9MRb
        sdan+j70r0jFn2y1s9n3AXMt/G9BPtOnb9acK9pZgQ==
X-Google-Smtp-Source: ABdhPJwBKS/nzcklSgTcmWAUbTNg6rAPoE2TkrRoT0FoG5ejhYLzJZR0AmTjZ0/Rlh2Fm2C61ogF444RffHBmN/e9ME=
X-Received: by 2002:a1c:1fd3:: with SMTP id f202mr4879371wmf.44.1631219003266;
 Thu, 09 Sep 2021 13:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Thu, 9 Sep 2021 16:23:11 -0400
Message-ID: <CA+-6iNzjXUxKitFobmVFE0bKO_gpNMYLF6MqK5CroPoKGCyJ4A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: Fix a memory leak in an error handling path
 in 'rproc_handle_vdev()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Sep 4, 2021 at 7:37 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'copy_dma_range_map() fails, the memory allocated for 'rvdev' will leak.
> Move the 'copy_dma_range_map()' call after the device registration so
> that 'rproc_rvdev_release()' can be called to free some resources.
>
> Also, branch to the error handling path if 'copy_dma_range_map()' instead
> of a direct return to avoid some other leaks.
>
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> Review with care. I don't like to move code around because of possible
> side-effect.
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..775df165eb45 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -556,9 +556,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>         /* Initialise vdev subdevice */
>         snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>         rvdev->dev.parent = &rproc->dev;
> -       ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -       if (ret)
> -               return ret;
>         rvdev->dev.release = rproc_rvdev_release;
>         dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>         dev_set_drvdata(&rvdev->dev, rvdev);
> @@ -568,6 +565,11 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>                 put_device(&rvdev->dev);
>                 return ret;
>         }
> +
> +       ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +       if (ret)
> +               goto free_rvdev;
> +
LGTM, thanks.
Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>

>         /* Make device dma capable by inheriting from parent's capabilities */
>         set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>
> --
> 2.30.2
>
