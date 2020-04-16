Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEF31ACF1D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Apr 2020 19:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgDPRvA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 16 Apr 2020 13:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727816AbgDPRvA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 13:51:00 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318D6C061A0C
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2020 10:51:00 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id w1so21949685iot.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2020 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvDNGsNqHjDrCE4+GX5Z6gol2sth2186m3RYDZYo6jk=;
        b=RkhPvzQlk8K06HidVYnpuuHKoyV8V8s0YxHSFPU3RVmE0gsVfzI+S1fpPNIe0O4XDJ
         NdXeCK4dbNixO2i31h5SSSs6wcviLJQcflaLesKk2o1GWUFcQa6T0u9VTGs2mGZh2pOI
         MEoVUC6U0G1KUSvDJFbgMtBytKlzah99fAVxXPoRIGJ6E3ON25RyjLalm6VcZJThQ10+
         O0L9QQ+I9nSggoZtpmEJb8XbZRba3cRKB1Ixvyfu9mZZyKMfMkLs07cM6fD+L3mlobxz
         +7UgG5Ax6pki170R9WGOYbN7JeCcKbThndmj2gHqjmaBYFFqcjF9kQkg/qV1qY63XUgU
         p0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvDNGsNqHjDrCE4+GX5Z6gol2sth2186m3RYDZYo6jk=;
        b=OHfDxz83ixjZEKk8Xsd4FrnOtAbUlxBQcrzXUKbmCAXEVFHKHBp4jrFj6Y0sNoe7q5
         /T2jilnxtasMVEis5mU7XMwa6Nh9n6nbA57YvXRbh4QbwC8jj6T6SR7OmLZdn0vtqoZ7
         uMSguSjFp0j1rWiJiBHHB1ekOpDFUfvBj+O7ErklP3G2nLdDb1yb/USLorspwbkbVC2b
         F7GjJfij9iGyvjp762KwzZT2alCLo9T02Iij3JO2g3yPY/ymeKGnX10kFcAgTVhaxCWx
         YKTfsBFTtijQiONJbOtqdcmp977GWJ0M/q28P8e5i5SYmrIi8cRVT7BS17nZfTM2bvdm
         YdrA==
X-Gm-Message-State: AGi0PuYQVVsSp5IZmEvwiIx5ro2zanBupAA3Ci1JeIsnhstpZuIXLPh7
        Yyga4f9w5HGK7hfryHtxqE/YEdRdmECEJa4DVmFrHg==
X-Google-Smtp-Source: APiQypKx+CBM28qFggfKWe/QuM8a/pfXbDXH+bEFQho9kkFzAeHXXsHurC7bCxult5cGDuDMhqXDmq76Cswy3AsWTaI=
X-Received: by 2002:a02:969a:: with SMTP id w26mr30960201jai.71.1587059459352;
 Thu, 16 Apr 2020 10:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200416140307.GA25561@ubuntu>
In-Reply-To: <20200416140307.GA25561@ubuntu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 16 Apr 2020 11:50:48 -0600
Message-ID: <CANLsYky6hdPnerfYvZk6SdO2supVPSr7Sa_x4-UsJ6Y5bgTfHQ@mail.gmail.com>
Subject: Re: RPMSG over VirtIO under KVM
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Guennadi,

On Thu, 16 Apr 2020 at 08:06, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> Hi,
>
> It has been proposed to port the VirtIO SOF driver [1], used to
> implement audio support under Linux, running in a KVM guest, to use
> RPMSG to communicate with the SOF vhost driver, running on the Linux
> host. On one hand I see an rpmsg-virtio driver, which should make such
> a port possible, on the other hand I don't see a single VirtIO driver
> in the kernel, using RPMSG for Linux virtualisation.

Above you wrote "rpmsg-virtio" driver, which I take to mean the code
found in file virtio_rpmsg_bus.c [1].  The code in [1] centers around
the communication between an application processor and some form of
remote processor (micro controller or dsp).  The "virtio" part of the
name refers to the underlying infrastructure put in place to
communicate with the remote processor, all coming from the virtio
space.  Here instead of using the virtio mechanic to communicate
between a host and a guest, it is used to communicate with a remote
processor.

I came to the same conclusion a while back - as of today no virtio
drivers are using RPMSG to communicate between host and guest.  I
suppose nobody needed it or implemented their own schemes.

[1].  https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/rpmsg/virtio_rpmsg_bus.c

>
> Hence my questions: is this a good idea? Is there anything in the
> kernel VirtIO RPMSG implementation, that would make this impossible?

I don't see why it wouldn't be a good idea, nor what would technically
prevent such a thing from happening.  Two things work in your favour:
1) the RPMSG foundation has been tailored to be used over different
kinds of hardware and 2) an existing implementation is already using
virtioqueues.

I suggest to start looking at function rpmsg_register_device(), used
by different RPMSG drivers - the magic is really in the RPMSG
operations (struct rpmsg_device_ops) that are used to abstract the HW
implementation.

Regards,
Mathieu

>
> Thanks
> Guennadi
>
> [1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
