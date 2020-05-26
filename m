Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17A51AE78C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 23:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgDQV2K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 17:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgDQV2J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 17:28:09 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0770C061A0F
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 14:28:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d1so1665000pfh.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OXaQ165Ni0b8WD+gPlIfNJ9eIDro22GRL0kc5Y0lP6Y=;
        b=L3lvYJftt+vZ3Cl/ynqir6A/dYh387oMAfxuo/9/YzDvEnmCRdDfySet804CsyD3+V
         +Uorn1IyqVtpQO9J5fyWfb4rqoUatDCwOpAxooKooD5hNHKQ7XMMLoKOXVlugXW4qEba
         cEMpFQq0agXOMVxVvPzqlPWRBdMo/o84wSuuMEFVDK9GNbTb5yugNqbqUj4hpymEETN4
         lskv1ckNU3wigFhoNXP4eI8BV6gcSYr/nzaJk7RQV7wlfuBLQYjKnhZ0fRP+SEeeRrFn
         ZyjW0EI0RTmsF/jPBRcJE9MFUfjlN4/ZIDRxaijONBnsuld5HigAE7wuUVFjO4sfx4Or
         B11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OXaQ165Ni0b8WD+gPlIfNJ9eIDro22GRL0kc5Y0lP6Y=;
        b=MaGGkZc8wfJPIWHg93xMaFRHpS6MsHUvkkn8QEvOTPqrhxnHrQiOdv9783V5cSOyvr
         kZXZKl9j89Z9u3PTTdLzCtKYgFgjHo9Lr6aZLhjK5xpSf8EebLYTw7xy5k2AOo0yv5Ob
         j+wFAlVqbLN8A50Ct2h4miJ8hNJsQ+D7LcWHjpKZmsnTHMy3xe6K+2cfIe8AT0//lmhE
         wmEOIdqxiSUqK25lY7JsNEnSke4dmBSL562SS3cu8pcBFZ0gXyHNyIMR4h6N7uWpAt9Z
         nSER8t5YlZUwSlY1sGp78lRPHHRZ5NOCJQJDaBFCORj8CYH9LR2RKBmpBtmFGSTVr8JZ
         AkaQ==
X-Gm-Message-State: AGi0PuYA0KSka6ySUvgh8Sw4pfCkfO7kGF1A4XCHNTKtpncVY3MFrGQt
        VGBbP61P6CZOkNFD3IbRdtX7HA==
X-Google-Smtp-Source: APiQypLGloCTLzOwQimrfyNagBcKFto5C3weAifCz0twCGZINKdgSfARSHgkKz2mCBDBxhA++qTqcA==
X-Received: by 2002:a62:3044:: with SMTP id w65mr3965935pfw.270.1587158889016;
        Fri, 17 Apr 2020 14:28:09 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e29sm15327461pgn.57.2020.04.17.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:28:08 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:28:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
Message-ID: <20200417212806.GB10372@xps15>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Apr 17, 2020 at 08:39:39AM -0500, Suman Anna wrote:
> Hi Markus,
> 
> On 4/16/20 1:26 AM, Markus Elfring wrote:
> > …
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> > >   {
> > >   	const char *p;
> > > 
> > > -	if (!firmware)
> > > +	if (firmware)
> > > +		p = kstrdup_const(firmware, GFP_KERNEL);
> > > +	else
> > >   		/*
> > >   		 * If the caller didn't pass in a firmware name then
> > >   		 * construct a default name.
> > >   		 */
> > >   		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> > > -	else
> > > -		p = kstrdup_const(firmware, GFP_KERNEL);
> > 
> > Can the use of the conditional operator make sense at such source code places?
> > 
> > 	p = firmware ? kstrdup_const(…) : kasprintf(…);
> 
> For simple assignments, I too prefer the ternary operator, but in this case,
> I think it is better to leave the current code as is.

I agree with Suman, that's why I didn't use the conditional operator.

> 
> regards
> Suman
