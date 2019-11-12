Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE14F88A9
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 07:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfKLGnZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 01:43:25 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40765 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfKLGnZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 01:43:25 -0500
Received: by mail-ed1-f66.google.com with SMTP id p59so14016411edp.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 22:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gu94hk6ViXZU/1pF57c89Mz0JcKl1j3IzzPZmTPjtQ=;
        b=LDDUyvLAAr/FgJFV0ODv1fscc3tceNs7i1JvEsFi9SbeCOxeMyJWafdRgYIlNqWV49
         ro79eCq++su+3IaTvSt6MwgL4SEwWPUZp7cEzIY5lMEh0+Vi4K+fFmiFNMR56+eI/hDL
         YUlIauWUKVBysNq/DieSbYjanJaQapqZXiAkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gu94hk6ViXZU/1pF57c89Mz0JcKl1j3IzzPZmTPjtQ=;
        b=YU4CFywrf0M4wRoz9JKkWUmdpVmav5VTNBvU5FGXGqYetmFDWjuB6Y7l91xLMor6c3
         3tpbq89ySa0TCXMvSxVRqg9pk0lZilZxeOPpKz9OClnQHQYPJY4HCysQfqM9GyHm1R8o
         aVa4JVKsuVBm/HHdOEIZaGEeSoIQpobRaUIBwPkwrAIwdJ7YW58jx8Db9yDoaUnvYNFX
         5OhObtwF7EKV1pnbLLXqaP8G8vLjnj1VOVmeSfbto3e1IG2J/ygiRW5m/IBdo9/q5892
         8h81sCTqT2IsK332eMNY6ucyBGA5ekcUSMRaL3f5O3t/mybJxMA+TJklaiTMD5EruUTo
         Z2kQ==
X-Gm-Message-State: APjAAAWFirGJOz3+TGNSuRmH7sIn0SQdlT1WQuppVRajiF6IjX6B9oMh
        5QCSGlLyIPPL6hfwxgFVhXXEyDWMSduPkH0x5UpSfw==
X-Google-Smtp-Source: APXvYqyMbA5YJasNK6lBrgNGRtM92Nacpnn0WpqptPvJ7NjQkzN/92o6yJP/Cb/7QkIhQbV5cTyTR309VkTgVeCpFuI=
X-Received: by 2002:a17:906:1d19:: with SMTP id n25mr25947734ejh.151.1573541003705;
 Mon, 11 Nov 2019 22:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20191014075812.181942-1-pihsun@chromium.org> <20191014075812.181942-4-pihsun@chromium.org>
 <20191111231023.GD3108315@builder>
In-Reply-To: <20191111231023.GD3108315@builder>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Date:   Tue, 12 Nov 2019 14:42:47 +0800
Message-ID: <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,
Thanks for the review, I'll address them in the next version. Some
inline comment below.

On Tue, Nov 12, 2019 at 7:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:
>
> > Add a simple rpmsg support for mt8183 SCP, that use IPI / IPC directly.
> >
>
> Hi Pi-Hsun,
>
> Sorry for not reviewing this in a timely manner! This looks good, just
> some very minor comments below.
>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> [..]
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index f2e5e70a58f2..7896cefb2dc0 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/remoteproc/mtk_scp.h>
> > +#include <linux/rpmsg/mtk_rpmsg.h>
> >
> >  #include "mtk_common.h"
> >  #include "remoteproc_internal.h"
> > @@ -407,6 +408,31 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
> >       of_reserved_mem_device_release(scp->dev);
> >  }
> >
> > +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> > +     .send_ipi = scp_ipi_send,
> > +     .register_ipi = scp_ipi_register,
> > +     .unregister_ipi = scp_ipi_unregister,
>
> These are exported symbols, so unless you see a need to support
> alternative implementations in the near future just skip the function
> pointers and call them directly.
>

Yes there is request from MTK that they do want to reuse the mtk_rpmsg
driver for things other than mtk_scp, so there's a need to support
alternative implementations for this.

> > +                struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
> > +                u32 id)
> > +{
>
> Regards,
> Bjorn

Regards,
Pi-Hsun
