Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C219C17616C
	for <lists+linux-remoteproc@lfdr.de>; Mon,  2 Mar 2020 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCBRpI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 2 Mar 2020 12:45:08 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:42664 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgCBRpH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Mar 2020 12:45:07 -0500
Received: by mail-il1-f194.google.com with SMTP id x2so226655ila.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Mar 2020 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sboKaEzAb8dDo8ic4Txr+gqE6z2BPnl5/jyRIrg2YGs=;
        b=vqYRGb9r7GpichkDcc8O4hlFY3pp72EXr8zLy4oOuHUN9wWnR8g5FD1EvQfGOVvqkY
         sRuF1ADlrISNDfp5JyFqoNVDLijFdF7aFGLcAaWcfNq4oe0r6gU9hLFYpuT1ickVklCn
         CLdpu7ULXNDWB9LlrtmXXRyNXJV7rolmIRoH8Ul0nXYVzZ3M0hpPq6Bsr3VdXLXBHVUP
         FENYOFAJwEpnilVvYgKSOV/FOVjGchZD2DwFoJ+v23lmQOhqLzX2VjFcvj9QRFgQpLX5
         BwfvicC0Ih7eg5Lp2vOptMvGRAEWXlh57bcb/4UJhBVhkn0Y2oOvC8ny6tDMLTYib2os
         /Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sboKaEzAb8dDo8ic4Txr+gqE6z2BPnl5/jyRIrg2YGs=;
        b=dzpmZLUY/UADED8n9MokB4h1o6Hwxv9yifSP1nPHXThK7WvuBhvML+RSqZZf8iskwf
         +zAFj3Np9HiXNi+yEJzsa1HWBlonbjmRAYWztLYXLtHlMOgCKm/fba2XZob1NITBj8+I
         negcPScjWXqbt5v9guKgjmn9Rpw9uvSS4FAV1EUDZ1gQKAJvS5p57hIzSyrejWy63yBM
         2erMmi+PqUJehLsH0lwio7ITkjW6ytSyPrPQhhA9cmXNgmzvhXRX6NDVPo2uWrKOOZQP
         ucUfPsBlwV5dgcDq9fDB7XfcvqfflMn8nBcOFEgFSN1YFxvn0skPW+ltz4kHWRBiJlrf
         u9Hg==
X-Gm-Message-State: ANhLgQ2uEgYiY0vw2qTVXuLp6gbmK2HX+VDFDEW/JUF2EU/DKtJt7miU
        s8g+Jl4dueLEKPrlQRZHG1gS19kttyeds2WDynwNzw==
X-Google-Smtp-Source: ADFU+vu0psz60mr8tK59SdVhE45L5RTpGteOpOydAzRFmNEUtHC65Ad33Ww3KbZbMBtK+aWWHY777/OBZyi95ecGDI8=
X-Received: by 2002:a05:6e02:eb4:: with SMTP id u20mr708304ilj.57.1583171107274;
 Mon, 02 Mar 2020 09:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
In-Reply-To: <20200228110804.25822-1-nikita.shubin@maquefel.me>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 2 Mar 2020 10:44:56 -0700
Message-ID: <CANLsYkyDsJaxO_37qTjEP+aeQju8W2+jhHFRF7+oifBMqJqyng@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: error on kick missing
To:     nikita.shubin@maquefel.me
Cc:     Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Nikita,

On Fri, 28 Feb 2020 at 04:07, <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <NShubin@topcon.com>
>
> .kick method not set in rproc_ops will result in:
>
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference
>
> in rproc_virtio_notify, after firmware loading.

There wasn't any kernel stack trace?  What platform was this observed
on? I'm afraid we won't be able to move forward with this patch
without one, or more information on what is happening.

>
> refuse to register an rproc-induced virtio device if no kick method was
> defined for rproc.
>
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..31a62a0b470e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>         struct rproc_mem_entry *mem;
>         int ret;
>
> +       if (rproc->ops->kick == NULL) {
> +               ret = -EINVAL;
> +               dev_err(dev, ".kick method not defined for %s",
> +                               rproc->name);
> +               goto out;
> +       }

I think it would be better to use WARN_ONCE() in rproc_virtio_notify()
than prevent a virtio device from being added.  But again I will need
more information on this case to know for sure.

Thanks,
Mathieu

> +
>         /* Try to find dedicated vdev buffer carveout */
>         mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
>         if (mem) {
> --
> 2.24.1
>
