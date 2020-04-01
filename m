Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4106E19B7F0
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 23:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbgDAVzE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 17:55:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42012 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732357AbgDAVzE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 17:55:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id 22so685993pfa.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 14:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fAD6ts60gKZlDaIuUBbzXJTGA1THr07RQz+MhmB+HOE=;
        b=N1dPNzL4j+JPft/Vl2wJWcuSiEF3zIzGQXzXGMsYA129anVJ0co+IMSvymdxm2jROW
         acNubR5sI8Sa2JaIrFugxez8N+5xmpom4nNqZpGk0EF/BfSn/JYFWDHVwv6s1J4iL94I
         xxFuiOn3osVFRKIW4POku3uOcDN744/1wHJc5kKi9vQ7Mjtr+5GD7SrA+aCJQfNnCZYI
         Wn85qYzDR2yz2LY83Q9ji81v333Iu8fjTLqSLmKSO2nmMH9zKjW4/NCWZ9QRLJLhd5G9
         UwsluU37SU945osP6ANpwUSLnnvSlKEjxBcSwhVWixnfL3jhgo2Ri0qaVEVCosxiy8ei
         /jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fAD6ts60gKZlDaIuUBbzXJTGA1THr07RQz+MhmB+HOE=;
        b=h7SuspxGpUWt5/DyyCdAY6Ebr42eCNcxbGHgGwUTdp3vvXJOIgq+ayMu8/j/zG2GeG
         wBgCsXAPOIbmFD3Kh/L8kCauZA3fcEpCYmW+ENgYgahTNwnJNudUIwyULw1pe2MsKVp7
         xp5qVmEEHDp1WWS3GZZoXJELpB82NK3mXWoyJY8+cMdvRIiA4dWRDcuA2tsgh+dijTc9
         zMBEVxzlpvTw9Son1IGMMb5w5b9agQqjpKWjLxbyxuSV+6Ga4ZxcbC7GaUZDTpwXMRz/
         d2NdvP/bPYa8S/zGZnsPAEQADNz7qqbA/V+00zPmJ754dhF8VuCnfr5h+Tx1vJ2xqbAi
         OqYg==
X-Gm-Message-State: AGi0PuZer8IS/WtXGJ/kUfFge/CUmFeqn1HNNhlhWAp7vHDKnsi63lc6
        3sePcK712A1QjWy/0epfEJYypA==
X-Google-Smtp-Source: APiQypIzcPknwmTZHcknHWZVnEJLbhief9rDE6GgyGD4zxf4ru4vghO7xB29hNnUXmus42Se0VN8OQ==
X-Received: by 2002:a63:79c2:: with SMTP id u185mr253123pgc.139.1585778103410;
        Wed, 01 Apr 2020 14:55:03 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d3sm2275761pfq.126.2020.04.01.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 14:55:02 -0700 (PDT)
Date:   Wed, 1 Apr 2020 15:55:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 13/17] remoteproc: Introducting new functions to start
 and stop an MCU
Message-ID: <20200401215501.GH17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-14-mathieu.poirier@linaro.org>
 <160253ad-1be1-f8ea-573d-5a73af25b0c7@ti.com>
 <1a3ca6eb-df01-6c54-e3ef-dad2f49d1b05@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3ca6eb-df01-6c54-e3ef-dad2f49d1b05@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 31, 2020 at 04:46:32PM -0500, Suman Anna wrote:
> On 3/31/20 1:08 PM, Suman Anna wrote:
> > Hi Mathieu,
> > 
> > On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> >> Add new functions to replace direct calling of rproc->ops->start() and
> >> rproc->ops->stop().  That way different behaviour can be played out
> >> when booting an MCU or synchronising with it.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     |  6 +++---
> >>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
> >>  2 files changed, 15 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 488723fcb142..d3c4d7e6ca25 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	}
> >>  
> >>  	/* power up the remote processor */
> >> -	ret = rproc->ops->start(rproc);
> >> +	ret = rproc_start_hw(rproc);
> >>  	if (ret) {
> >>  		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
> >>  		goto unprepare_subdevices;
> >> @@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	return 0;
> >>  
> >>  stop_rproc:
> >> -	rproc->ops->stop(rproc);
> >> +	rproc_stop_hw(rproc);
> >>  unprepare_subdevices:
> >>  	rproc_unprepare_subdevices(rproc);
> >>  reset_table_ptr:
> >> @@ -1485,7 +1485,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >>  	rproc->table_ptr = rproc->cached_table;
> >>  
> >>  	/* power off the remote processor */
> >> -	ret = rproc->ops->stop(rproc);
> >> +	ret = rproc_stop_hw(rproc);
> >>  	if (ret) {
> >>  		dev_err(dev, "can't stop rproc: %d\n", ret);
> >>  		return ret;
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 5f711ceb97ba..7ca23d46dfd4 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -160,4 +160,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >>  	return NULL;
> >>  }
> >>  
> >> +static inline int rproc_start_hw(struct rproc *rproc)
> >> +{
> >> +	RPROC_OPS_HELPER(start, rproc);
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static inline int rproc_stop_hw(struct rproc *rproc)
> >> +{
> >> +	RPROC_OPS_HELPER(stop, rproc);
> >> +	return -EINVAL;
> >> +}
> > 
> > Since we already have the concept of subdevices, how about we call these
> > rproc_{start/stop}_device?
> 
> Actually, does this patch needs to be moved up in the order atleast
> prior to patch 11, may be after patch 9?

Sure, that can be done...

> 
> regards
> Suman
> 
> > 
> >> +
> >>  #endif /* REMOTEPROC_INTERNAL_H */
> >>
> > 
> 
