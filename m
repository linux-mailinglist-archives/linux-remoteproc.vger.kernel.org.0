Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D003235600
	for <lists+linux-remoteproc@lfdr.de>; Wed,  5 Jun 2019 06:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbfFEEeI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 5 Jun 2019 00:34:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40160 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEEeI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Jun 2019 00:34:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so11660654pgm.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Jun 2019 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pc+c8eY7Iq/+7TtGxqa35YybGgmrc2UlNdR+JGfsU4M=;
        b=zkcAKbCn2gFSmlQi34ZZkufmznF9FSLA8mpn09NFi+m1OVsEL3ASGTnJeGNHnFXWpF
         UjsjvAoxGm35tZs+K1UjJ3uFX66rwlxbprNwUebASYISBOqSWsYyFiBFY+u/j3pKZfxl
         nvoI6PTX3Omm32LIyhKVoigr66Dr2E5jfhexllz0jb/TRGJXUP8TlAhA23uSle7R1YPh
         jcxLZaHBUKzgYSYSLPueb2ZeOznwlCyZUFSR7euf/85DAvWYrtG3/tSbpqbhhP9b6IWL
         b7h3q/xKdPOeSWQ7Aq6xE+fHQE6NpETOfHamY4ZRPguXOi9jyv13D007sR0cdqiLaXA8
         iDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pc+c8eY7Iq/+7TtGxqa35YybGgmrc2UlNdR+JGfsU4M=;
        b=cCHt0pE3QdPSRpd+3RN+NN8QyNcDKkJQyb69ZjTNwzZrUKmsqREFh2+iIel5cDJ3+H
         8QRqz8rpjglIL4qnztMZ91ibi2ylu4Kmz+c9P6/llSLPHzIC3/OBxhnQ6GeaYu4Xk8dt
         gTBCJ5uVgwNTnCRPqxM7XISgWvp1HP/1AFyOcWB36xq2A+DBvGVPjHzuU37u8wcrGsrq
         uOPlbV/MAtA8JjhVWMKyUh1rFOBrPHEJh8vhZPJV4D+JAWoAkMErHGUNjjw7i0GGuS73
         QMK0iVCurelx4Rqk/6XWthqTHX341BLWGTeJyGGy8iO1hOWBFWxJZmNFUthQW5u3xFui
         xIpg==
X-Gm-Message-State: APjAAAV8JOFENW85f5qPPSR6XT2qP/RVcIeDFgQyLiy0fH9JSGSqhQ58
        9mUAVM52/doSx6mSHt34ElD48A==
X-Google-Smtp-Source: APXvYqz9sXuQx/EU3mOB34oM3DKhkPDs+bF8LZHwDiH9jjJI+PMu78/upExQhosAA/9iTcdG7GuKnQ==
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr38438089pjj.13.1559709247265;
        Tue, 04 Jun 2019 21:34:07 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w187sm26524476pfb.4.2019.06.04.21.34.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 21:34:06 -0700 (PDT)
Date:   Tue, 4 Jun 2019 21:34:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Xiang Xiao <xiaoxiang781216@gmail.com>
Cc:     ohad@wizery.com, wendy.liang@xilinx.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiang Xiao <xiaoxiang@xiaomi.com>
Subject: Re: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
Message-ID: <20190605043452.GI22737@tuxbook-pro>
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 31 Jan 07:41 PST 2019, Xiang Xiao wrote:

> Hi,
> This series enhance the buffer allocation by:
> 1.Support the different buffer number in rx/tx direction
> 2.Get the individual rx/tx buffer size from config space
> 
> Here is the related OpenAMP change:
> https://github.com/OpenAMP/open-amp/pull/155
> 

This looks pretty reasonable, but can you confirm that it's possible to
use new firmware with an old Linux kernel when introducing this?


But ever since we discussed Loic's similar proposal earlier I've been
questioning if the fixed buffer size isn't just an artifact of how we
preallocate our buffers. The virtqueue seems to support arbitrary sizes
of buffers and I see that the receive function in OpenAMP has been fixed
to put back the buffer of the size that was received, rather than 512
bytes. So it seems like Linux would be able to send whatever size
messages to OpenAMP it would handle it.

The question is if we could do the same in the other direction, perhaps
by letting the OpenAMP side do it's message allocation when it's
sending, rather than Linux pushing inbufs to be filled by the remote.

This would remove the problem of always having suboptimal buffer sizes.

Regards,
Bjorn

> Xiang Xiao (3):
>   rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
>   rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer separately
>   rpmsg: virtio_rpmsg_bus: get buffer size from config space
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 127 +++++++++++++++++++++++---------------
>  include/uapi/linux/virtio_rpmsg.h |  24 +++++++
>  2 files changed, 100 insertions(+), 51 deletions(-)
>  create mode 100644 include/uapi/linux/virtio_rpmsg.h
> 
> -- 
> 2.7.4
> 
