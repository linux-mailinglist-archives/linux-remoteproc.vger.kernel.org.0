Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D3D19878F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 00:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbgC3Wp7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 18:45:59 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33693 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3Wp7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 18:45:59 -0400
Received: by mail-pl1-f194.google.com with SMTP id g18so7360843plq.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zZ9zHEhLIDqVsi6Cz+Zx6pbNZgHca94Pq7iQclalSOI=;
        b=osQM7ADN7pHOs4QtANYPrQcf5eG7G8m92LOwSLs0JSthCMXUBFxP+wyvM8YP3JhC2a
         AZo0H0//ibzz2m9AQg+xVCh9jUylgQDjX6Wk26XyQqv+NZZqxvC9FsIdJopqSWtyLJXH
         EdY9NaywEKpupY8IPpKiSqCIKGctJOszxEQyUEv91a8U0zgpEGk0RRSwRO204XGE24oq
         sJzsTX3rkQ/cwyDWwMj408dsTJPN5XZB3+iF2WOo5Et0EPS+pn00A4xfyqxVKi9STGtC
         DpkwgsY0PmqW+qhArXAQoFLmyyYRROgs3ySzkZEz/JtqDFqpCg+v+Ozx1lj8N6OEiH7Y
         +/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zZ9zHEhLIDqVsi6Cz+Zx6pbNZgHca94Pq7iQclalSOI=;
        b=U1d/Rvx/291QQWG6T9zb0pR/W6q2NrUX1gDDd3iVL87ERy9wg9EOb92DapxlxCvvvx
         xrB3H07A8EaLduW+HlY8VWI8gWUFBgUEesdyoMPkDCauDSLUUxiwFEyhD3o8xfKjTNJo
         euzX7Wee4ggHCoHl5oj6Yz0nAHjQj/g8usN6MIZe2ens+LsmW3q4GpfbYtwRCtnOU/ol
         8+Lus+r2JG6ji7LDapR/+QnFjBh3+ICfxTnFhlhdUhkXcKF1hR4uG3gqzaHdlXt6Hu1w
         y2BCY4GY2+HcYN/KQicOBh7jD4qGs29W+bWUzSbRoatK5aN8tF33ZWGMGzTfmKxWai1e
         4CZQ==
X-Gm-Message-State: AGi0PuamHDCN46XM7jK7gN7cGr6tugkcCT1pRLMHV7gNEOUoaw2a+sVv
        JNTjBDV60hJ41hPNjXox/BD+wg==
X-Google-Smtp-Source: APiQypI9IITmeWnF9fYsCy5c4R1uLydX3rIPaJERYX8ztJ8AZxPpTpEOhziKi9doNs2qx4wKtbwsEg==
X-Received: by 2002:a17:90a:5802:: with SMTP id h2mr358500pji.141.1585608357469;
        Mon, 30 Mar 2020 15:45:57 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z17sm11041812pff.12.2020.03.30.15.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:45:56 -0700 (PDT)
Date:   Mon, 30 Mar 2020 15:45:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH 1/2] remoteproc: Add userspace char device driver
Message-ID: <20200330224554.GD215915@minitux>
References: <1585241440-7572-1-git-send-email-rishabhb@codeaurora.org>
 <1585241440-7572-2-git-send-email-rishabhb@codeaurora.org>
 <20200330221245.GA17782@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330221245.GA17782@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 30 Mar 15:12 PDT 2020, Mathieu Poirier wrote:
[..]
> > +	struct rproc *rproc;
> > +
> > +	rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> > +	if (!rproc)
> > +		return -EINVAL;
> > +
> > +	rproc_shutdown(rproc);
> 
> The scenario I see here is that a userspace program will call
> open(/dev/rproc_xyz, SOME_OPTION) when it is launched.  The file stays open
> until either the application shuts down, in which case it calls close() or it
> crashes.  In that case the system will automatically close all file descriptors
> that were open by the application, which will also call rproc_shutdown().
> 
> To me the same functionality can be achieved with the current functionality
> provided by sysfs.  
> 
> When the application starts it needs to read
> "/sys/class/remoteproc/remoteprocX/state".  If the state is "offline" then
> "start" should be written to "/sys/.../state".  If the state is "running" the
> application just crashed and got restarted.  In which case it needs to stop the
> remote processor and start it again.
> 

A case when this would be useful is the Qualcomm modem, which relies on
disk access through a "remote file system service" [1].

Today we register the service (a few layers ontop of rpmsg/GLINK) then
find the modem remoteproc and write "start" into the state sysfs file.

When we get a signal for termination we write "stop" into state to stop
the remoteproc before exiting.

There is however no way for us to indicate to the modem that rmtfs just
died, e.g. a kill -9 on the process will result in the modem continue
and the next IO request will fail which in most cases will be fatal.

So instead having rmtfs holding /dev/rproc_foo open would upon its
termination cause the modem to be stopped automatically, and as the
system respawns rmtfs the modem would be started anew and the two sides
would be synced up again.

[1] https://github.com/andersson/rmtfs

Regards,
Bjorn
