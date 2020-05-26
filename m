Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CD41DD71C
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 May 2020 21:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbgEUTXG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 May 2020 15:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729145AbgEUTXF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 May 2020 15:23:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F09C061A0E
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 12:23:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so3836944pfx.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y63aS+NaGtpwqRet4e2k+offwk7YhLSwL57svUyiQxU=;
        b=WMQxmoMkXiaxv0IrSbei9pAXdBwNmZcH/MmXSAHk0JQ+WNZrIH7HEba2ekgrpCCNnV
         8G3X4p37vonBB3EjlGHPRR1rRLrqgq67toMztCXcGaThOLwaKDYZF8+T4+R47eCxXfbb
         eDB8FIjJSw+ufhgTj5wvOWtqxyYv1gwgjN7ro+v86hkhNsDQUN4nHQ/rX5qWwlwXgBfb
         cR2Yy2xsInkhcgL5wSXNmSSvdKTqi6F8NLyrsED6Kb/owzBsMrzxnJmP5P12YaTL3RAL
         VVNmVk90RZ2svNNtUqrks2k9+f2I4DU0q1KXL+zdLQlrJAfRem72f2ZaGT/M7KVwEc8N
         DHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y63aS+NaGtpwqRet4e2k+offwk7YhLSwL57svUyiQxU=;
        b=LKmn39Vz5/iqNH/CFQrtNSRvOjZt48Qsv294hPqqWpM6hORp0Aunny6O+DoRyoPbZc
         GF+WbETzbqH0wnTWw9+nunOHLbzRCLmLyRhhdoEiF+ezyfCUbkI8RAEbPOcsPGymlJoI
         8XUZ8QS0I/IEVcMa53qYEMfa4tZ4gLzxg8xtSUW+HRTWju6OCPj8VR6wzPvLCWBljLPf
         2enL2UZLzSN3D9XiK4kr2iFLfPt85tjn3zRVjjmkkS6QS+QuiavVbx8QjmU8oTcu5je9
         JQBjBNML5l6Vh67eagEGQtoAsEDVgliloVDmeIJKCaVjdpB+xFn6A1tImtTJFQCE65vy
         pr3Q==
X-Gm-Message-State: AOAM531oNIERmOt/Ie73LVRtL3uitXnP8G9reLYulem9n61C2t3BbhzU
        9ifkRio5K6dyM44YEEW2/5ap3Q==
X-Google-Smtp-Source: ABdhPJzU9w9G5TLd0sTBUx6ZZiZCtV51V0ECeg4y2odgj10sq90602L1zxAVvLWHKXJp6BCaPA09ng==
X-Received: by 2002:a05:6a00:1342:: with SMTP id k2mr272459pfu.32.1590088985204;
        Thu, 21 May 2020 12:23:05 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m14sm4648350pgt.6.2020.05.21.12.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:23:04 -0700 (PDT)
Date:   Thu, 21 May 2020 12:21:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: introduce version element into resource
 type field
Message-ID: <20200521192146.GO408178@builder.lan>
References: <20200325204701.16862-1-s-anna@ti.com>
 <20200325204701.16862-3-s-anna@ti.com>
 <20200521175421.GI408178@builder.lan>
 <b338480e-c586-f988-f5b6-784551b7beb6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b338480e-c586-f988-f5b6-784551b7beb6@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 21 May 12:06 PDT 2020, Suman Anna wrote:

> Hi Bjorn,
> 
> On 5/21/20 12:54 PM, Bjorn Andersson wrote:
> > On Wed 25 Mar 13:46 PDT 2020, Suman Anna wrote:
> > 
> > > The current remoteproc core has supported only 32-bit remote
> > > processors and as such some of the current resource structures
> > > may not scale well for 64-bit remote processors, and would
> > > require new versions of resource types. Each resource is currently
> > > identified by a 32-bit type field. Introduce the concept of version
> > > for these resource types by overloading this 32-bit type field
> > > into two 16-bit version and type fields with the existing resources
> > > behaving as version 0 thereby providing backward compatibility.
> > > 
> > > The version field is passed as an additional argument to each of
> > > the handler functions, and all the existing handlers are updated
> > > accordingly. Each specific handler will be updated on a need basis
> > > when a new version of the resource type is added.
> > > 
> > 
> > I really would prefer that we add additional types for the new
> > structures, neither side will be compatible with new versions without
> > enhancements to their respective implementations anyways.
> 
> OK.
> 
> > 
> > > An alternate way would be to introduce the new types as completely
> > > new resource types which would require additional customization of
> > > the resource handlers based on the 32-bit or 64-bit mode of a remote
> > > processor, and introduction of an additional mode flag to the rproc
> > > structure.
> > > 
> > 
> > What would this "mode" indicate? If it's version 0 or 1?
> 
> No, for indicating if the remoteproc is 32-bit or 64-bit and adjust the
> loading handlers if the resource types need to be segregated accordingly.
> 

Sorry, I think I'm misunderstanding something. Wouldn't your 64-bit
remote processor need different firmware from your 32-bit processor
anyways, if you want to support the wider resource? And you would pack
your firmware with the appropriate resource types?


Afaict the bit width of your remote processor, busses or memory is
unrelated to the choice of number of bits used to express things in the
resource table.

Regards,
Bjorn
