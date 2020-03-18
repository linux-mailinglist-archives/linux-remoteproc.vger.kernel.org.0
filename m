Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1614418A098
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Mar 2020 17:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgCRQh4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Mar 2020 12:37:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43712 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgCRQhz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Mar 2020 12:37:55 -0400
Received: by mail-io1-f65.google.com with SMTP id n21so25544558ioo.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2020 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bHvF/ZlLZRPJNXeX7IQP/GnB5t47oAv5GS/6FYJ6Q04=;
        b=pnMs6pDb+zpIjQXq19TmUvFaBoN8y/Ut/zX3ynNA5og7jG4tPoyENRWF/qx1nsQrub
         mDsN/tHH3PWCs70q/+NkM+GC+pdsuRlPrrjKzGPDQjnoM/XKE6Wsa2WZ9c2lL1wSSdm6
         l6XiL42Wuds0sbVtH3v5N+OKe+AN0bNE94u2BX0nf9T1+f+iQlSFhrmhDkg4rcTidDRp
         YMxnwRu13jDPOl9YPIO1pI+lcbTWvwq3DMO+fY9qviEIjpRzw/P2ZqOuDmkTSUZrTXH2
         WEichE5El5mfqpWFU90dLNW9IJIeZAvAmqylWSuIex/TTiOBpNhEq+TQKHp53LAkJvsW
         qgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bHvF/ZlLZRPJNXeX7IQP/GnB5t47oAv5GS/6FYJ6Q04=;
        b=jAPzqzAv2SSRm/vWD6ClxPTokD1DLK8vL8FRynOEAItxxDJnHoDxzHi+SGE9LlLs/k
         r7Y9W2qLOo9aFTrKzcblOPTdz0bgwBnvMhyfYye6HIGWrcxXxZTcGoIEbpMPQemj5FlO
         mOGDFeGU9//WeAyUZNPaIuwa38MF1FJ5RPVgj2fXPlfuHLtp4gieLGOOxBHR0wfwCs8E
         z8ZCqcBFucw8k3v4tITeIsBrWc3DM8yNfPa8Z8YdW1ZUvMMpbyJc7P4fGcJoub41Ln/i
         gZtluhAN7ac13MMeO0dH8DB8qzWLhR/VTAzFOFLiRYBKp4JkuVi6BHOsY0ab4EJKxis7
         9okA==
X-Gm-Message-State: ANhLgQ21ShU7gUeqnu8CZiMP9aONu4L/gUGRfoI2IXdbaKBznq3z7WOK
        R6+J59rXzGMpeg75yPUR0vMQb3OCsUHOiJul/14Z5iqO
X-Google-Smtp-Source: ADFU+vsGFJMbF7mRySBJfPQfm1jyPRyVaRvWEyc0DDvMwkXAXsoXYYfGEipU9LJ5n7MDTzDYyy1woOb+YG3ak1gl5YA=
X-Received: by 2002:a05:6602:2ace:: with SMTP id m14mr4603134iov.131.1584549474362;
 Wed, 18 Mar 2020 09:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200305224108.21351-1-s-anna@ti.com> <20200305224108.21351-3-s-anna@ti.com>
 <20200317180530.GA1801@xps15> <17204b55-2d58-d8cf-e504-6b6969afa987@ti.com>
In-Reply-To: <17204b55-2d58-d8cf-e504-6b6969afa987@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 18 Mar 2020 10:37:43 -0600
Message-ID: <CANLsYkzU_X1QfkMZigbNsxu2i2qsaq2oxojBuKR5uYFNXmsHgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: Fix and restore the parenting hierarchy
 for vdev
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

On Wed, 18 Mar 2020 at 09:00, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu,
>
> On 3/17/20 1:05 PM, Mathieu Poirier wrote:
> > Hi Suman,
> >
> > On Thu, Mar 05, 2020 at 04:41:08PM -0600, Suman Anna wrote:
> >> The commit 086d08725d34 ("remoteproc: create vdev subdevice with specific
> >> dma memory pool") has introduced a new vdev subdevice for each vdev
> >> declared in the firmware resource table and made it as the parent for the
> >> created virtio rpmsg devices instead of the previous remoteproc device.
> >> This changed the overall parenting hierarchy for the rpmsg devices, which
> >> were children of virtio devices, and does not allow the corresponding
> >> rpmsg drivers to retrieve the parent rproc device through the
> >> rproc_get_by_child() API.
> >>
> >> Fix this by restoring the remoteproc device as the parent. The new vdev
> >> subdevice can continue to inherit the DMA attributes from the remoteproc's
> >> parent device (actual platform device).
> >>
> >> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 097f33e4f1f3..ba18f32bd0c4 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -510,7 +510,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
> >>
> >>      /* Initialise vdev subdevice */
> >>      snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> >> -    rvdev->dev.parent = rproc->dev.parent;
> >> +    rvdev->dev.parent = &rproc->dev;
> >
> > I can see how it would not be possible to retrieve the parent rproc device since
> > rvdev->dev.parent was set to be platform device...
> >
> > I wonder how the original change didn't blow up sysmon_probe() and potentially
> > other out-of-tree users of rproc_get_by_child().
>
> QCOM code uses SMD transport, and not virtio_rpmsg transport, and the
> parent-child relationship is direct rproc subdevices which are added in
> their platform drivers directly. This affects only virtio-rpmsg clients.
> Please see qcom_add_smd_subdev().

Thanks for the clarification, I didn't go that far in my investigation.

>
> It would be nice to have
> > someone from the QCOM team test your patch.
> >
> >>      rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> >>      rvdev->dev.release = rproc_rvdev_release;
> >>      dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> >
> > Be mindful there might be fallouts from applying this patch since it does change
> > the location of the vdev under /sys/device/platform/ .
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Thanks for the review.
>
> regards
> Suman
