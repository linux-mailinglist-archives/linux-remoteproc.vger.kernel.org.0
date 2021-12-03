Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE154467D9D
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Dec 2021 19:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhLCTAs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 3 Dec 2021 14:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241391AbhLCTAq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Dec 2021 14:00:46 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F51EC061353
        for <linux-remoteproc@vger.kernel.org>; Fri,  3 Dec 2021 10:57:22 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y13so15221560edd.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Dec 2021 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hD4l+D/+jBR1l02iiNBBh1vx/MLSXsOsv7EqwsEMIxs=;
        b=SI1RrBe/+gvFatPLC2kgaqo/6TWht95sThyAYn1qmUY6JraFMWuGcE/ItoxFURH4MV
         F7EXSzrlCYr9d125SpZLx7dkTkPuWh9tIlMRCjbAvBaYum5qvS8mOKqH2QksW0v9d4Ly
         GUs8H5jGJ5VsHEn6MUZDi+NsGv2pV1OWg71dDo3h3pMvkm28ZrhUmMxORWYxfsIFexkR
         lWDOAhhIfTJUaoT6VpOCTbfOaBpwrBNbwQbDFHgWX/B+htYaEN0pMVwJiWBgmgTMmWYw
         nyaMq6cYLs+N6URbX+meM8xNRMotLWtmLlVIvnzUd7mhnlREhlHPau5v+bfrOASxcF5d
         Hr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hD4l+D/+jBR1l02iiNBBh1vx/MLSXsOsv7EqwsEMIxs=;
        b=GWCxt/28UDcZhypv1OmHW1jOaWmay/6OtZW9zsoMRjXDZxIK7cz9mHQhoRS/HdHCuk
         D5Ynvrfs62iajm5xKImuPxbflRZnnMSE6fwUQex/l41T65TfWfWNNmH6rytT+vR/XCfl
         rY9M4mt64VBaCE9hLCxlRuyNCrIF6wBoyIzER5SZajrsb3HbBts11fGtS16Xf0XORR1A
         1ihbGZ8kCKUFD8wOUB9RBsIohO8UpGHeqG8uESYKE1WUMbt08BHeiMTeELhDs3jehKAp
         7Ptx5Wsd/zvCHo+OJwaQWOATc0XC9S6n3msIRQrkkGAogcjJ2wR9YUI6bjHJm20lhtcL
         MYHQ==
X-Gm-Message-State: AOAM530QIONXodY9o2I6Ag19FKEB/RPZah0THJlxEsEvFYWKSrcsJNDB
        VEF6M7HdOFaAU+3483IS9oo2t4XJAZw/zx7JmhJI8w==
X-Google-Smtp-Source: ABdhPJxQ4BgzO/ntM4IZnhN5zAD/ZEj2i9Ud/iiJnXbHBqNRxbXwei7sOQHFI7g8w+H8BpIPlEFJk2EfoX0ZTTe7rwE=
X-Received: by 2002:a05:6402:2551:: with SMTP id l17mr29467140edb.142.1638557840962;
 Fri, 03 Dec 2021 10:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org> <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
 <20211202170011.GA900071@p14s> <CACGkMEs5DWPT76U8KYdr385e0Y6EUQQRSfRMfR3ZZz34HBdVKA@mail.gmail.com>
In-Reply-To: <CACGkMEs5DWPT76U8KYdr385e0Y6EUQQRSfRMfR3ZZz34HBdVKA@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 3 Dec 2021 11:57:08 -0700
Message-ID: <CANLsYkxfhamUU0bb4j7y6N4_G9odKxLCjXxgXEx4SJ6_Kf+M2Q@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: virtio: don't let virtio core to validate used length
To:     Jason Wang <jasowang@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 2 Dec 2021 at 19:07, Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Dec 3, 2021 at 1:00 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Hey guys,
> >
> > On Thu, Nov 25, 2021 at 10:15:44AM +0800, Jason Wang wrote:
> > > On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > > > > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > > > > reuse the buffer the following error message is displayed in
> > > > > the virtqueue_get_buf_ctx_split function:
> > > > > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> > > > >
> > > > > As described in virtio specification:
> > > > > "many drivers ignored the len value, as a result, many devices set len
> > > > > incorrectly. Thus, when using the legacy interface, it is generally
> > > > > a good idea to ignore the len value in used ring entries if possible."
> > > > >
> > > > > To stay in compliance with the legacy libraries, this patch prevents the
> > > > > virtio core from validating used length.
> > > > >
> > > > > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> > > > >
> > > > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > >
> > > > Arnaud, thanks a lot for the analysis.
> > > >
> > > > Jason, I think this is another good point. We really should not
> > > > validate input for legacy devices at all.
> > >
> > > I agree. Will do that in the next version.
> >
> > I'm a little unclear about the "next version" in the above comment - is this
> > something I should wait for?  Should I move forward with Arnaud's patch?
>
> Just to make it clear. If my understanding is correct, my series was
> reverted so this patch is not needed.

Ok - thanks
