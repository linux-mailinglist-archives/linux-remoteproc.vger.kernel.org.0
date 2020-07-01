Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9461621131C
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Jul 2020 20:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgGASzt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Jul 2020 14:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgGASzs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jul 2020 14:55:48 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7D3C08C5DB
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jul 2020 11:55:48 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s14so10256677plq.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2020 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N8mdJZc20bx/fo0pg63xpTRYXUKZHJBXG1PEyR4+fF8=;
        b=KVveur8EaYo8GE1wia+o8Y3IIX9L9nTBR6YT5+trww3t8t7wxav7kgIDZovilOumRr
         HW1ddoUkGgxnQarE0l7P10JCDtquNMmxMwGVpqLCVa9ZPJ8OIxvDBWgQRV443iRhaKg/
         I4iWZSlSyyffQ0LyxumOEIJ29YAtSHfajWvK0He66pVz+lmOmkJbOikdNkntSQsAUI3Q
         E6zrpJukuD2MNgvw2fPC5vtnbDs7+80Z+jIAwwfQaZSY7jmd+kbWta6pNzpGOCOWCTgH
         UvTX1qaknjob6BYi8l2x4kKhRpmnTGsg81iQfj5ZjLDY9jUretjjbBj9Ry1Kj00I/ZZq
         Tf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N8mdJZc20bx/fo0pg63xpTRYXUKZHJBXG1PEyR4+fF8=;
        b=tFp131KasPo3b1+hcTDcaUemkvCKEK8JzqYyUZuuLcS2smCvDxZQRoWXMrxo0f2QEg
         YrT+3S14xY+lUgopU5JI33z9VcEiiZ6XH6457NaSVMc7NjA/q1vdnUq4bFpEvDZlIXtS
         8rBlASAb5G86BHR72r+jsn8ZjNUWyq6j+/jNdY6Sbi2RxF414pEsUR+akqmAsv70JtBm
         Sd266pMpwQsB1l7loR8PiQ9A3vOgaaCmBgnAljd9BFbxTw+WzXTYwnsSe7N0U0q3Sfv0
         hsbLKONMPvVq948muNduRYdaonX5swDOoLh2/SvMUIe+MgfOqi7O2kSLjRz6kdQiNH+D
         JI1w==
X-Gm-Message-State: AOAM5318s7dntbY5uaq4trIDKr9INq/Ne3VnNTtNIGKrkZ03f5Q94WOb
        1bBSD0DpSTsVLb62gUUyfcH3hzb/LL4=
X-Google-Smtp-Source: ABdhPJyR5rzwtFtzaIVuuwshlKmAVQAUhkCzjUsU6PpMEiar8NvD1WI4KHLzI8BtEZFTgG9TUsnH6w==
X-Received: by 2002:a17:90a:354d:: with SMTP id q71mr30489874pjb.216.1593629748050;
        Wed, 01 Jul 2020 11:55:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g18sm6613164pfk.40.2020.07.01.11.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 11:55:47 -0700 (PDT)
Date:   Wed, 1 Jul 2020 11:53:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        "rishabhb@codeaurora.org" <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "linux-remoteproc-owner@vger.kernel.org" 
        <linux-remoteproc-owner@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] remoteproc: Add remoteproc character device
 interface
Message-ID: <20200701185318.GA950397@builder.lan>
References: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
 <1587492618-15896-2-git-send-email-rishabhb@codeaurora.org>
 <d72ead5a-b25a-d4e2-4bbf-1790d2a64fb8@st.com>
 <d9a477cbbf19ed50af49aee7c6699e09@codeaurora.org>
 <3738198d-53d4-2fe6-a92b-2db0cd0afa68@st.com>
 <83c70517-32e4-9ce0-e1b4-2ed7a8b5c506@codeaurora.org>
 <94541ff3-ba34-3a08-f989-6e1a0a88fbf2@st.com>
 <d194ff3e-ef61-6e58-b684-f8144bc5dec8@codeaurora.org>
 <275e39c4-0e0b-8ca2-ae0b-d0d435cfc720@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <275e39c4-0e0b-8ca2-ae0b-d0d435cfc720@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 01 Jul 05:13 PDT 2020, Arnaud POULIQUEN wrote:

> 
> 
> On 7/1/20 12:02 AM, Siddharth Gupta wrote:
> > 
> > On 6/30/2020 12:43 AM, Arnaud POULIQUEN wrote:
> >>
> >> On 6/30/20 7:38 AM, Siddharth Gupta wrote:
> >>> On 6/17/2020 1:44 AM, Arnaud POULIQUEN wrote:
> >>>> On 6/16/20 9:56 PM, rishabhb@codeaurora.org wrote:
> >>>>> On 2020-04-30 01:30, Arnaud POULIQUEN wrote:
[..]
> >>>>>> IOCTLs should probaly be documented.
> >>>>> I have added documentation to
> >>>>> Documentation/userspace-api/ioctl/ioctl-number.rst
> >>>>> Is there another place where I need to add documentation for this?
> >>>> Could you add in this file comments that describe
> >>>> the IOCTL usage and associated parameter?
> >>>>
> >>>> Regards,
> >>>> Arnaud
> > 
> > I don't see any for of comments that describe in detail the IOCTL usage, 
> > i.e.,
> > input parameters, etc. Could you provide an example so I can follow it?
> > 
> > If not, should I instead put them in Documentation/remoteproc.txt?
> 
> Bjorn and Mathieu are the right persons to decide on the best place.
> 
> Here are 2 exemples of "inline" documented IOCTRLs.
> 
> https://elixir.bootlin.com/linux/latest/source/arch/s390/include/uapi/asm/tape390.h#L15
> https://elixir.bootlin.com/linux/latest/source/drivers/net/wan/cosa.h#L63 
> 
> Could be something like that:
> 
> /*
>  * The RPROC_SET_SHUTDOWN_ON_RELEASE ioctl allows to enable/disable the 
>  * automatic remote processors shutdown when the controlling userpsace
>  * closes the char device interface.
>  *
>  * input parameter: integer
>  *   0    : disable automatic shutdown
>  *   other: enable automatic shutdown
>  */ 
> #define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, int)
> 
> /*
>  * The RPROC_GET_SHUTDOWN_ON_RELEASE ioctl gets information about the 
>  * automatic remote processors shutdown when the controlling userpsace
>  * closes the char device interface.
>  *
>  * output parameter: integer
>  *   0: automatic shutdown disable
>  *   1: automatic shutdown enable
>  */ 
> #define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, int)
> 

I like this. Thanks for digging up an example Arnaud!

Regards,
Bjorn
