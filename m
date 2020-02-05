Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D0153BC5
	for <lists+linux-remoteproc@lfdr.de>; Thu,  6 Feb 2020 00:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBEXVv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 5 Feb 2020 18:21:51 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37238 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgBEXVv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 18:21:51 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so1716182pgl.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Feb 2020 15:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lo2U7Cm41NEux3tpa79q2qCKfO3Ap8IXhpATcSH2FnU=;
        b=tQtqopk4J/UZBC0Si7TYrDLFEhAc0/6e7xPsq3K/jHvINdKdnaDIqSqN8a3WeEDmFG
         5TXqPplnWXR4Zid4MXmgiQbp9IzUJR7nYPr2uzHEOdCSRD0D2UDXTw1tJvHgSElRcf/g
         /FB7JlI0U26GlUUI6cozKJpJQHI0SZgTfkWe5B6BuDNiaox7KbBLoWawapYN3FN2azuy
         CSNrpDqxFBioxdnkExPbPVGKi6BJ8Y6KYrznXeKi0dpuhvbn4iEa04wWzJbgljeCp6Ex
         JSFOU8Ogst7PsrA9QpSNIezT2IIB6+XPR7UIc+M/Qlp+uSrxTjMUkS24cEUGjiWdJY9p
         Ta6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lo2U7Cm41NEux3tpa79q2qCKfO3Ap8IXhpATcSH2FnU=;
        b=eo6kygiHP7Fxx61HB45PuSj1LI43zBJThQfWIOksScTbZtjsl+v+tLvxPvFqe8Q+QB
         CJMaaQlnAO0R+YDrwej9+y9PNFH0apeiJLCFabN5AYp0fs1Wav9aSv9YCHGP7YLryvmc
         0Tm2Cd6VmlAeu8GvFe3WEM8wB6qJF5aKB51iqJOgfpy+nfxXftTH7TBpUq8O8AzlC2Kd
         eIuYdHUyUYz/p7bNWqTclpQ1+HMd7mgdWrnYu7QeTZYnU6pgfA4Iqkdfc2BkJg2P964F
         ARxB7pLvPgyij8Tp5NYDmdAccIeFUIj1NeC5NiojeSmdDo4FaGiT/nsyH9sg7Of/lkK+
         ptLw==
X-Gm-Message-State: APjAAAW4HXfsBedUQoPEU8kFOHntbrrxTm2RuoPceq9TbsczLpB3D8O7
        +S5Wu29ySlirQ1JOk/7InfU0fJXjASg=
X-Google-Smtp-Source: APXvYqzm+jQ4IdSkLS45RaR98qNXUM59VS3Qx/+0Q8xqPHZIH+W4HnXy/FB8U1Pp1pjGjdSyihCKYw==
X-Received: by 2002:aa7:820d:: with SMTP id k13mr511809pfi.10.1580944911025;
        Wed, 05 Feb 2020 15:21:51 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u7sm558768pfh.128.2020.02.05.15.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 15:21:50 -0800 (PST)
Date:   Wed, 5 Feb 2020 16:21:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>
Cc:     linux-remoteproc@vger.kernel.org
Subject: Re: How to get src and dst for pru_rpmsg_send?
Message-ID: <20200205232148.GC25901@xps15>
References: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Andrew,

On Wed, Feb 05, 2020 at 02:24:07AM -0800, Andrew P. Lentvorski wrote:
> I seem to be missing something obvious: Where do I get the values for
> src and dst in the pru_rpmsg_send() function?
> 
> The TI examples do a pru_rpmsg_receive() first and then echo back to the
> same src and dst.  That seems ... odd.  What's the point of having a
> variable src and dst if they are effectively hardwired to a single
> communication channel?

Since pru_rpmsg_send/receive() don't exist in the mainline kernel you will have
to be more specific... What TI examples are you referring to?  Where can we find
them? 

There are other rpmsg_sendxyz() functions that allow you to send messages to
different addresses[1].  Given the amount of information, I'm afraid there isn't
much else I can add at this time.

Thanks,
Mathieu  

[1]. https://elixir.bootlin.com/linux/latest/source/include/linux/rpmsg.h#L125


> 
> Thanks.
