Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BC4177B41
	for <lists+linux-remoteproc@lfdr.de>; Tue,  3 Mar 2020 16:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgCCP4v (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 3 Mar 2020 10:56:51 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:45056 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgCCP4v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:56:51 -0500
Received: by mail-il1-f194.google.com with SMTP id p8so3158939iln.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2020 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yB7awomhhSLM8b43Luq3et8NngDIS5f4GAy/rRpWIU=;
        b=ApyQXlpE8POx42t2ZK44WczRod93oLbrJoAUnYmysEi2A62FXsk5hY7jg6HAN3z7wd
         5o+O8hWQzrApCc5V/Dc8fkFS/RZ4uoC7bfraBY1MPfaHoz6lKJGjeb/xORyr2D6nDQp2
         e4raLMcI62LVufcwIsI7ZEuGx+Mp+CMWnjthVAxgwS7TAdeO83hm06RS3HphkYmreFf+
         1poY1DTFBD8EAq9PJ7inPxcqRUIxmsWhnqSnlq6qRt4KZa5O8txC5pezaYc3AzthF5fb
         q13MlRx3DZNCF/zy04POG0xYjaPo+VlkiQjxSTfeQt3hUNp3GIEOSz76w76C3AaTDseh
         RKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yB7awomhhSLM8b43Luq3et8NngDIS5f4GAy/rRpWIU=;
        b=rQugIY/46RDLArVmjYpOsaXSkcFNAa87Sp8UN7/IJob3dlP7jSdyIK1u5r7iU54vsJ
         GoyhSiTTh94o8cnPC5OA1bBMTfJGqMOwqlS4mM0efiiaXyN0HmgpSn/1cIE1C9ziTgLr
         5onQDB5iU6aOfc3FdNOsi7HH/tls0J9Qw+2KETQa+v25hFOwKzXv5ksvVPdCYJOuG4Gb
         hQ3R+SdsI4MgHjgATTgPKqCggCQeQar+6nW3F/9OWdaTcNU9O/gmjl9iOI1La4B4wktU
         TxllgxYN0y0UmFnVf6S5vmyXuMZuXYki63agD2LLCT4P7Pp1CAfsFIksn9qJf+3PUrqi
         xF7A==
X-Gm-Message-State: ANhLgQ1x8p2wL5OXjtIpCjqEJxIcnCpRYluPPXzV+hFiN3J1VX2v3wSQ
        1xGUeCnm/ucVCyftcuIfSzyqelmxfrwtL6tEObyA1g==
X-Google-Smtp-Source: ADFU+vsd00+POHP0vUwGObFVF7Hg36VaPsyjktz0Dqdy7JiLY0u7jDQTSATV6BuxiOeALgxUAQknocEntpuBDpekP3g=
X-Received: by 2002:a92:6610:: with SMTP id a16mr3592900ilc.140.1583251010762;
 Tue, 03 Mar 2020 07:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
 <CANLsYkyDsJaxO_37qTjEP+aeQju8W2+jhHFRF7+oifBMqJqyng@mail.gmail.com> <20200302214317.GI210720@yoga>
In-Reply-To: <20200302214317.GI210720@yoga>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 3 Mar 2020 08:56:40 -0700
Message-ID: <CANLsYkwBxNecM4M2Ld_HFecOiQJ=S0FFWQY1KJTwY3VGLyr_FA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: error on kick missing
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     nikita.shubin@maquefel.me, Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 2 Mar 2020 at 14:43, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Mon 02 Mar 09:44 PST 2020, Mathieu Poirier wrote:
>
> > Hi Nikita,
> >
> > On Fri, 28 Feb 2020 at 04:07, <nikita.shubin@maquefel.me> wrote:
> > >
> > > From: Nikita Shubin <NShubin@topcon.com>
> > >
> > > .kick method not set in rproc_ops will result in:
> > >
> > > 8<--- cut here ---
> > > Unable to handle kernel NULL pointer dereference
> > >
> > > in rproc_virtio_notify, after firmware loading.
> >
> > There wasn't any kernel stack trace?  What platform was this observed
> > on? I'm afraid we won't be able to move forward with this patch
> > without one, or more information on what is happening.
> >
> > >
> > > refuse to register an rproc-induced virtio device if no kick method was
> > > defined for rproc.
> > >
> > > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > > ---
>
> Nikita, please include "v2" in the subject and add here (below the ---)
> short summary of what changes since v1.
>
> > >  drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 8c07cb2ca8ba..31a62a0b470e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >         struct rproc_mem_entry *mem;
> > >         int ret;
> > >
> > > +       if (rproc->ops->kick == NULL) {
> > > +               ret = -EINVAL;
> > > +               dev_err(dev, ".kick method not defined for %s",
> > > +                               rproc->name);
> > > +               goto out;
> > > +       }
> >
> > I think it would be better to use WARN_ONCE() in rproc_virtio_notify()
> > than prevent a virtio device from being added.  But again I will need
> > more information on this case to know for sure.
> >
>
> I reviewed v1 and afaict there's no way rproc->ops->kick would change
> and that things wouldn't work without a kick.

Yes, a "v2" tag and a little bit of history would have helped.  We
came to the same conclusion - I couldn't see either how things would
work without a kick(), especially if an rvdev with virtio queues is
used.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> So I requested that it should be checked during initialization instead.
> Please let me know if I missed some case.
>
> Regards,
> Bjorn
>
> > Thanks,
> > Mathieu
> >
> > > +
> > >         /* Try to find dedicated vdev buffer carveout */
> > >         mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > >         if (mem) {
> > > --
> > > 2.24.1
> > >
