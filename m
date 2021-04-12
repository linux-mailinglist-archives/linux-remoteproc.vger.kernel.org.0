Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A1E35D1AC
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Apr 2021 22:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhDLUDI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 12 Apr 2021 16:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbhDLUDH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Apr 2021 16:03:07 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D99C06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Apr 2021 13:02:49 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id y32so10228895pga.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Apr 2021 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WVDXmeX52NfVN0DmkVlJtvmcxR3Npy2o/kss1K8CAaU=;
        b=VM5OO7HGLu6YFlVH4dlpvNPofEOfL9YasDMNEwSlAGZZT7jxKthbkCcEQIC5gNzULh
         aY9OuADEmOlDvM/9f7+Uk1ln8J02NJFqoVJ/ahaNWe7/YGpL1y1pc0qonBrflIq+0Lbt
         ZMwCXMbUa50IQF78qjUP1MrxgtbHXUErSXc6OhIp0LB6I7LqTfn27vD93uto3VXaj4BR
         NBiSmvjfJFGs66t2mXNlj25BtVKKfIQlcSJgVujI188ttZFIcQtHfUHxm6jFDT4RhAhL
         0xxH9gsTvRGcYvwR85p0aEyhkryrAF3kWPzkuJ8AVNgaxLADfM50PJcUW4A/6JGoqEp+
         z+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WVDXmeX52NfVN0DmkVlJtvmcxR3Npy2o/kss1K8CAaU=;
        b=F4MYRLRsfwTk6TzpflPQVrtTacHlhgC2P/j5u22RrtHcDn2fZr62JOiML/oEX58hBN
         RlWkShxH4TGUJRZXLFxs5KLF96SDypE0voTXNUXewMQT5DvRfIlyrldCNS0+P81ns3wI
         NnM5oh+WvLtonvNZJS698v2wfbf7ToKRA0CVJoQYaP4Zp8KyN/wjyMOzusIC7blidBO3
         zd7m4aXzapzkA0NFs822Z9SWEdohoz+dtctUZ4mODr/mwGO6JL+oMySC2cm1YY+TyfO8
         AXoxELYmWEnZyBxDKVjkTNYTTTmk5pmL/FFkCY+Ci8TuRUZGbJyfU/sJriPOubd5U88y
         iuAA==
X-Gm-Message-State: AOAM532qFnE5S9ZjBNIKaTtu+sfC4L1kD2Roo1pLu6tJyoj73Omh+kNa
        sXbFGb74eIi8Zm71BnxY8PqiimJ9KtrUuw==
X-Google-Smtp-Source: ABdhPJxt+z0aQNOGOH5sN6m+iEk0+U1kVtq0OY2gs8QNxDdq78Hc/a5yRUyvNMkBzn2BHsKtXpq0Kg==
X-Received: by 2002:a63:f926:: with SMTP id h38mr29530934pgi.257.1618257768578;
        Mon, 12 Apr 2021 13:02:48 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v123sm10493376pfb.80.2021.04.12.13.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 13:02:48 -0700 (PDT)
Date:   Mon, 12 Apr 2021 14:02:45 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/7] Restructure the rpmsg char and introduce the
 rpmsg-raw channel
Message-ID: <20210412200245.GB582352@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 23, 2021 at 01:27:30PM +0100, Arnaud Pouliquen wrote:
> This series is the second step in the division of the series [1]: 
> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
> 
> The purpose of this patchset is to:
> - split the control code related to the control
>   and the endpoint. 
> - define the rpmsg-raw channel, associated with the rpmsg char device to
>   allow it to be instantiated using a name service announcement.
>     
> An important point to keep in mind for this patchset is that the concept of
> channel is associated with a default endpoint. To facilitate communication
> with the remote side, this default endpoint must have a fixed address.
> 
> Consequently, for this series, I made a design choice to fix the endpoint
> on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
> on FS open/close.
> 
> This is only applicable for channels probed by the rpmsg bus. The behavior,
> using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
> preserved.
>   
> The next steps should be to correct this:
> Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
> to instantiate the rpmsg devices
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 
> Arnaud Pouliquen (7):
>   rpmsg: char: Export eptdev create an destroy functions
>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>   rpmsg: Update rpmsg_chrdev_register_device function
>   rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
>   rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
>   rpmsg: char: No dynamic endpoint management for the default one
>   rpmsg: char: Return error if user try to destroy a default endpoint.
>

I am done reviewing this set.

Thanks,
Mathieu
 
>  drivers/rpmsg/Kconfig             |   9 ++
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>  drivers/rpmsg/qcom_smd.c          |   2 +-
>  drivers/rpmsg/rpmsg_char.c        | 221 +++++++++-------------------
>  drivers/rpmsg/rpmsg_char.h        |  50 +++++++
>  drivers/rpmsg/rpmsg_ctrl.c        | 233 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>  9 files changed, 368 insertions(+), 160 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> -- 
> 2.17.1
> 
