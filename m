Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23F019CADF
	for <lists+linux-remoteproc@lfdr.de>; Thu,  2 Apr 2020 22:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388706AbgDBUQr (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Apr 2020 16:16:47 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45759 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388978AbgDBUQr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Apr 2020 16:16:47 -0400
Received: by mail-pl1-f195.google.com with SMTP id t4so1753253plq.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2020 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m2gwzKO30X+5nSbWsefgWWT3/bQam9UHKH+R1iDKsoE=;
        b=XB5NuZy3pmOOW6GQrnDTJNJW6SAJyvNEtpPNt7e33gQV4sMaBVtAHUQc2V8XMvW/AI
         xeImbx1l++xnMt0yLXQe/r+uUxXHgo6O7FU32trfR9NgviuCXztu9cHeGGttICUDJ9HW
         F0cQr3XJPkVITeyEoOBja6ASkKueLgIyc/Nu9EWd00yNr8p1Cd3mqShSdheymR2Qw1UX
         81OH8VGAD4lO6wBGczGtAL+SgBGtQMtayrG5wbZvVOnftGq0i2WIgpXauG4drbJ6xoJO
         6CvstduLwAyuMg812VT0ASA80YoLk0UXEMpm0NX1hsW70P0kpZHqgXU+qs20C5zPyf+Z
         v4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m2gwzKO30X+5nSbWsefgWWT3/bQam9UHKH+R1iDKsoE=;
        b=Hm2heihTMpOJ+VyX3HR/VqVlRD/fccP9pToO7JQWfyhB30z+Xx82F9nSKRrLDWPv8h
         smhQ7SnSmcLRRedk/cZ98Gks8z5ozNcew67jHl1k1dXJd7Sm1B2WJZgYuzaewuoQNWUk
         N9SeVswJ3Qfwy4pHXd7Jy0GcJRoYLGe3Gc4a4dpfL/b11+fEZOCu+IkyZ5GVii2HCqW3
         cZqLvKzCl3vHXD6JReJ9vLrzMA8yTvRdayangpfxdVI+gapIzCoWjY6t9DOAv0qILphl
         6+FrVlW+oTV8CChiqFD0SQ/0s+RG8ySIj7yzL+/wbimDN9+/2sC7XZiiwMjDxs9OT5i8
         2ctw==
X-Gm-Message-State: AGi0PuYk+Xzt3zTPQsO8/nlNr9Xxm49GVzZ4+5+ktq0hbVjSUkfkWjLN
        hYog3FkT0IFq1Rsa/E4lt7QyhQ==
X-Google-Smtp-Source: APiQypLgDkzyM6vMHjqRivzpZARsEnncXGlwOT2X5V6jCFHsFm+NRCnHE/v3j5oC174dz4Nuhjp+Sw==
X-Received: by 2002:a17:902:b004:: with SMTP id o4mr4233090plr.54.1585858605286;
        Thu, 02 Apr 2020 13:16:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w2sm4188173pff.195.2020.04.02.13.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 13:16:44 -0700 (PDT)
Date:   Thu, 2 Apr 2020 14:16:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/17] remoteproc: Call the right core function based
 on synchronisation state
Message-ID: <20200402201642.GA9160@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-10-mathieu.poirier@linaro.org>
 <006ab94d-daf3-0e28-7098-982d473c00d5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006ab94d-daf3-0e28-7098-982d473c00d5@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 31, 2020 at 10:10:50AM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> > Call the right core function based on whether we should synchronise
> > with an MCU or boot it from scratch.
> 
> This patch does generate some checkpatch warnings.

Right, checkpatch is complaining but other than duplicating the same code for
all functions, I don't see another way to do this.

> 
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_internal.h | 36 +++++++++++-------------
> >  1 file changed, 17 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 73ea32df0156..5f711ceb97ba 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -106,38 +106,41 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
> >  	}
> >  }
> >  
> > +#define RPROC_OPS_HELPER(__operation, ...)				\
> > +	do {								\
> > +		if (rproc_sync_with_mcu(rproc)) {			\
> 
> So this does make the logic a bit convoluted, since you have three
> different flags for rproc_sync_with_mcu, and you apply them in common
> for all the ops. This is what I meant in my comment on Patch 1.

There is indeed 3 different flags but they are only valid in a specific state.
What "ops" are you referring to here?  I'm also not sure about the comment in
"patch 1" - which one would that be and how does it relate to the current block
of code.  Apologies, I need more clarifications.  

> 
> > +			if (!rproc->sync_ops ||				\
> > +			    !rproc->sync_ops->__operation)		\
> > +				return 0;				\
> > +			return rproc->sync_ops->__operation(__VA_ARGS__); \
> 
> Use the same semantics as the regular ops instead of two return
> statements, the code should fallback to the common return 0 after the
> RPROC_OPS_HELPER when neither of them are present.

Yes the tests are exactly the same, no reason to proceed differently.

> 
> regards
> Suman
> 
> > +		} else if (rproc->ops && rproc->ops->__operation)	\
> > +			return rproc->ops->__operation(__VA_ARGS__);	\
> > +	} while (0)							\
> > +
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->sanity_check)
> > -		return rproc->ops->sanity_check(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(sanity_check, rproc, fw);
> >  	return 0;
> >  }
> >  
> >  static inline
> >  u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->get_boot_addr)
> > -		return rproc->ops->get_boot_addr(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(get_boot_addr, rproc, fw);
> >  	return 0;
> >  }
> >  
> >  static inline
> >  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->load)
> > -		return rproc->ops->load(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(load, rproc, fw);
> >  	return -EINVAL;
> >  }
> >  
> >  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->parse_fw)
> > -		return rproc->ops->parse_fw(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(parse_fw, rproc, fw);
> >  	return 0;
> >  }
> >  
> > @@ -145,10 +148,7 @@ static inline
> >  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
> >  		     int avail)
> >  {
> > -	if (rproc->ops->handle_rsc)
> > -		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
> > -					      avail);
> > -
> > +	RPROC_OPS_HELPER(handle_rsc, rproc, rsc_type, rsc, offset, avail);
> >  	return RSC_IGNORED;
> >  }
> >  
> > @@ -156,9 +156,7 @@ static inline
> >  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  						   const struct firmware *fw)
> >  {
> > -	if (rproc->ops->find_loaded_rsc_table)
> > -		return rproc->ops->find_loaded_rsc_table(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(find_loaded_rsc_table, rproc, fw);
> >  	return NULL;
> >  }
> >  
> > 
> 
