Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7887135966D
	for <lists+linux-remoteproc@lfdr.de>; Fri,  9 Apr 2021 09:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhDIHcN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 9 Apr 2021 03:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbhDIHcM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Apr 2021 03:32:12 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89175C061762
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Apr 2021 00:31:58 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id l76so3243997pga.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Apr 2021 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BF+Ynk25edmDGRQzllVeejrpjdoiXp/2zkQWTVrdN/I=;
        b=g5TDCJpB6VHinqvDcni+7Djgn4WO1pCqA4mjyC4KtcE2/poU5PO98s871xwf0sdgFC
         9sF/pL+L5BZlOuLm1KdnKdUHAgh8irK96w68V4c/hSK+/4SbjLfGFDmHzLJWBP2WTQPX
         eek13SjDE84wxB1TZ+cApyigA4TNxI5SRVtkAfhrKbQy42p7I7A6yLWUDxWZNmdixlJ4
         4feSMP/5ydPRwno+5OUPL1WXP3ty7Lgs/9FIhYIen7rRfcMwXUrhGJqtdqCe9SESWn8c
         vmeoIckesF9dEwydL/pyrUP3yZBv7uJ9Uy7kEJKS4/YWQ6gvImwb8dTYG4krzQ5XNRqu
         Mojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BF+Ynk25edmDGRQzllVeejrpjdoiXp/2zkQWTVrdN/I=;
        b=G/tq/psT3o/d1GfzeHA+2JEAtbQfF3HnLCwBwr/aN0eJ8L7haainSk3/ECwuIPaewB
         qVFKLY60pv7A8NQ+W8C93snLxCPO25gOEzMhH+MREDZ0n7DFYHekkau1DHHgrTphgYlP
         /MloFqdMbRreOlJMUQJ+WlV/8mOkVzrIZRov58Ss656LsDb5dgZY2+OwaKZ6WtBf+Y8H
         9MQTb2+5WIyHCbX0Z8dcu26zAMILqWwt94cKYtFt7BLkbdnfArZ99Y5plJu9lKU0d2RS
         YwhvmbQ8EeJKpedg2xa58U0p7xMti4Js0NDBe7J7owvJshTawR3Sj12NUUsVQGgwhp/Q
         GZGw==
X-Gm-Message-State: AOAM531jLUVPRtbyL3VzEBZBfKthnYvc6ztEmgO3yserEOR809WOowjk
        7gGwBV40gO+qUA+96FzhTCgt
X-Google-Smtp-Source: ABdhPJzpSrEdAvXiTBAf4hBdLS6zlntm+U3O+7tXwn8kQBk+GYj5GAcg5B5h98Nx9AIZYqOx1wSNaw==
X-Received: by 2002:a63:d242:: with SMTP id t2mr11789981pgi.431.1617953517730;
        Fri, 09 Apr 2021 00:31:57 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id gk20sm1423565pjb.17.2021.04.09.00.31.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 00:31:57 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:01:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <20210409073153.GE4376@work>
References: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
 <1617344238-12137-2-git-send-email-deesin@codeaurora.org>
 <YGn0wBkOOILgaq5w@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGn0wBkOOILgaq5w@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Apr 04, 2021 at 12:17:52PM -0500, Bjorn Andersson wrote:
> On Fri 02 Apr 01:17 CDT 2021, Deepak Kumar Singh wrote:
> 
> > Not all upcoming usecases will have an interface to allow the aoss
> > driver to hook onto. Expose the send api and create a get function to
> > enable drivers to send their own messages to aoss.
> > 
> > Signed-off-by: Chris Lew <clew@codeaurora.org>
> > Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> > ---
> >  drivers/soc/qcom/qcom_aoss.c | 36 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> > index 53acb94..5c643f0 100644
> > --- a/drivers/soc/qcom/qcom_aoss.c
> > +++ b/drivers/soc/qcom/qcom_aoss.c
> > @@ -8,10 +8,12 @@

[...]

> > +	pdev = of_find_device_by_node(np);
> 
> of_find_device_by_node() will increment the refcount of the underlying
> struct device of pdev, so you need to platform_device_put() once you're
> done with it.
> 
> As a side effect of not putting the struct device, the devm_kzalloc'ed
> qmp pointer will remain valid. So care is needed to make sure that the
> client doesn't end up with a dangling pointer if the qmp device is
> removed.
> 
> My suggestion is that you add a "qmp_put()" function, which invokes
> platform_device_put() and that you add some sort of tracking ("bool
> orphan"?) to the struct qmp and make qmp_send() fail if this is set.
> 

I think this is a duplication of what the struct device offers. Why
can't we use the generic infrastructure for this usecase?

Like using device_initialize() in qmp_probe() along with a release
callback for "struct device", then using get_device() in qmp_get().
Then there should also be a qmp_put() API which calls put_device() to
decrease the refcount.

Ideally, the final refcount should be dropped in qmp_remove() and then
the release callback will be called automatically to free "struct qmp".

> That way if someone unbinds the aoss device, the client will still have
> a "valid" pointer, but won't be able to qmp_send() after qmp_close() has
> been called in the aoss remove function.
> 

How can someone remove the qmp device if a client is holding its reference?

Thanks,
Mani

> Regards,
> Bjorn
> 
> > +	if (!pdev)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	qmp = platform_get_drvdata(pdev);
> > +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> > +}
> > +EXPORT_SYMBOL(qmp_get);
> > +
> >  static int qmp_probe(struct platform_device *pdev)
> >  {
> >  	struct resource *res;
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
