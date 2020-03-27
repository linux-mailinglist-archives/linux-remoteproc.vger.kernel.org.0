Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2895B196037
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 22:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgC0VKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 17:10:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42593 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbgC0VKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 17:10:05 -0400
Received: by mail-io1-f67.google.com with SMTP id q128so11297629iof.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2020 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yCu29sF7/9bpaHqxN72enHyDap2fTL4Wq66CIKsPpEY=;
        b=ASYcAoafXRoEzEWSariqshAsT+j9QhzKLWcRyYI/J7RrFJ3R88xBa+rxFTQyGTt9y9
         ocHoUHSxpsZ4wId13m/t6JQQiXctM3Va0/G4nETgHbzkSnXJxLE8lrcuLqq90cD+jzph
         kx4/kFI302YE23/yPXxgtCi1/5vH1ChGBFZtM1djBV+5LflqR2RnKPBIObrXpkv5N/oC
         x8SZmuRgPv1ZFTyOz8vb/tdjhp+H4alwuvUUqi262xaWM6Uy+ucuDF+KDE/F0S/I6Pl7
         QU1VsuGWBRWXOTRXxH8GQt3Ex804mHBzTgb1xLc2dxXwPzIHOqfH/GNkJwCK3495RSt2
         2CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yCu29sF7/9bpaHqxN72enHyDap2fTL4Wq66CIKsPpEY=;
        b=tLWfAtI+bDDbpMqAoJK4JlUB1u8Z64VLP2aee9x+dsYggLFQfvodR170gDhsJ8S17I
         RNu64bGGFc3WODcBRCcChFgbSLCgRyHIZcXAgPj6eEuqoylQq35HHqFyrFfT8ycFW2Op
         FnG41H8vxWCVnGgSSLlycuy9RgjTJdAZpbxizaktwBvMSECZbH1DfGN0wj0fQxA0C6nf
         +7T+RuylBxhcvqPkzgWhiPQlOlA+m8l44r9eXNpy/K0AkPoPYbpvc2PYTNOilZbg5mTl
         ylI9bMIhHNqmq5YDsLy8F7PCIDS1kf003UIRDl+5HbVPjwsevo1E2gKbOe1CZcC0iFmK
         bYjw==
X-Gm-Message-State: ANhLgQ2pVTr6D5wLncIVqDDPp4qKDchwY1BzVibEJ3Dr+ZlZeUluvARr
        Z9QqhVj9ZX0uZfk58NdPYF5m2hZZ82tgCfhn42YCqw==
X-Google-Smtp-Source: ADFU+vvmLK0vKgoXRzNBVodknfg2chjl22QtD7GRJ0sq2T5chg5/4voJ7KdAZN666I037Yauz/jnqd6T0HR/2Pz+xfY=
X-Received: by 2002:a05:6602:2ace:: with SMTP id m14mr558136iov.131.1585343404257;
 Fri, 27 Mar 2020 14:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200319162321.20632-1-s-anna@ti.com> <20200319162321.20632-2-s-anna@ti.com>
 <20200325203812.GA9384@xps15> <207036a8-b34e-6311-5ad6-3289eb9f7a06@ti.com>
In-Reply-To: <207036a8-b34e-6311-5ad6-3289eb9f7a06@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 27 Mar 2020 15:09:53 -0600
Message-ID: <CANLsYkzU79LDVWO=wtoOY-=iW0a4EUf5sruwWicyj+2EAFZ4rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: fall back to using parent memory pool
 if no dedicated available
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 25 Mar 2020 at 17:39, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu,
>
> On 3/25/20 3:38 PM, Mathieu Poirier wrote:
> > On Thu, Mar 19, 2020 at 11:23:20AM -0500, Suman Anna wrote:
> >> From: Tero Kristo <t-kristo@ti.com>
> >>
> >> In some cases, like with OMAP remoteproc, we are not creating dedicated
> >> memory pool for the virtio device. Instead, we use the same memory pool
> >> for all shared memories. The current virtio memory pool handling forces
> >> a split between these two, as a separate device is created for it,
> >> causing memory to be allocated from bad location if the dedicated pool
> >> is not available. Fix this by falling back to using the parent device
> >> memory pool if dedicated is not available.
> >>
> >> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >> v2:
> >>  - Address Arnaud's concerns about hard-coded memory-region index 0
> >>  - Update the comment around the new code addition
> >> v1: https://patchwork.kernel.org/patch/11422721/
> >>
> >>  drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
> >>  include/linux/remoteproc.h             |  2 ++
> >>  2 files changed, 17 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >> index eb817132bc5f..b687715cdf4b 100644
> >> --- a/drivers/remoteproc/remoteproc_virtio.c
> >> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >> @@ -369,6 +369,21 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >>                              goto out;
> >>                      }
> >>              }
> >> +    } else {
> >> +            struct device_node *np = rproc->dev.parent->of_node;
> >> +
> >> +            /*
> >> +             * If we don't have dedicated buffer, just attempt to re-assign
> >> +             * the reserved memory from our parent. A default memory-region
> >> +             * at index 0 from the parent's memory-regions is assigned for
> >> +             * the rvdev dev to allocate from, and this can be customized
> >> +             * by updating the vdevbuf_mem_id in platform drivers if
> >> +             * desired. Failure is non-critical and the allocations will
> >> +             * fall back to global pools, so don't check return value
> >> +             * either.
> >
> > I'm perplex...  In the changelog it is indicated that if a memory pool is
> > not dedicated allocation happens from a bad location but here failure of
> > getting a hold of a dedicated memory pool is not critical.
>
> So, the comment here is a generic one while the bad location part in the
> commit description is actually from OMAP remoteproc usage perspective
> (if you remember the dev_warn messages we added to the memory-region
> parse logic in the driver).

I can't tell... Are you referring to the comment lines after
of_reserved_mem_device_init() in omap_rproc_probe()?

>
> Before the fixed-memory carveout support, all the DMA allocations in
> remoteproc core were made from the rproc platform device's DMA pool (
> which can be NULL). That is lost after the fixed-memory support, and
> they were always allocated from global DMA pools if no dedicated pools
> are used. After this patch, that continues to be case for drivers that
> still do not use any dedicated pools, while it does restore the usage of
> the platform device's DMA pool if a driver uses one (OMAP remoteproc
> falls into the latter).
>
> >
> >> +             */
> >> +            of_reserved_mem_device_init_by_idx(dev, np,
> >> +                                               rproc->vdevbuf_mem_id);
> >
> > I wonder if using an index setup by platform code is really the best way
> > forward when we already have the carveout mechanic available to us.  I see the
> > platform code adding a carveout that would have the same name as rproc->name.
> > From there in rproc_add_virtio_dev() we could have something like:
> >
> >         mem = rproc_find_carveout_by_name(rproc, "%s", rproc->name);
> >
> >
> > That would be very flexible, the location of the reserved memory withing the
> > memory-region could change without fear of breaking things and no need to add to
> > struct rproc.
> >
> > Let me know what you think.
>
> I think that can work as well but I feel it is lot more cumbersome. It
> does require every platform driver to add code adding/registering that
> carveout, and parse the reserved memory region etc. End of the day, we
> rely on DMA API and we just have to assign the region to the newly
> created device. The DMA pool assignment for devices using
> reserved-memory nodes has simply been the of_reserved_mem_device_init()
> function.

Given all the things happening in the platform drivers adding and
registering a single carveout doesn't seem that onerous to me.   I
also expect setting rproc->vdevbuf_mem_id would involve some form of
parsing.  Lastly if a couple of platforms end up doing the same thing
might as well bring the code in the core, hence choosing a generic
name such as rproc->name for the memory region.

At the very least I would use of_reserved_mem_device_init_by_idx(dev,
np, 0).  I agree it is not flexible but I'll take that over adding a
new field to structure rproc.

Thanks,
Mathieu

>
> regards
> Suman
>
> >
> > Thanks,
> > Mathieu
> >
> >>      }
> >>
> >>      /* Allocate virtio device */
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index ed127b2d35ca..07bd73a6d72a 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -481,6 +481,7 @@ struct rproc_dump_segment {
> >>   * @auto_boot: flag to indicate if remote processor should be auto-started
> >>   * @dump_segments: list of segments in the firmware
> >>   * @nb_vdev: number of vdev currently handled by rproc
> >> + * @vdevbuf_mem_id: default memory-region index for allocating vdev buffers
> >>   */
> >>  struct rproc {
> >>      struct list_head node;
> >> @@ -514,6 +515,7 @@ struct rproc {
> >>      bool auto_boot;
> >>      struct list_head dump_segments;
> >>      int nb_vdev;
> >> +    u8 vdevbuf_mem_id;
> >>      u8 elf_class;
> >>  };
> >>
> >> --
> >> 2.23.0
> >>
>
