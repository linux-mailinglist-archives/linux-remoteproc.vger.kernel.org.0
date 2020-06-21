Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F13A202C56
	for <lists+linux-remoteproc@lfdr.de>; Sun, 21 Jun 2020 21:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbgFUTdK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 21 Jun 2020 15:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgFUTdK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 21 Jun 2020 15:33:10 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FA7C061794
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Jun 2020 12:33:10 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u8so6990563pje.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Jun 2020 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8V6HFmLfGm9H0h60UuqXdO7H0Hr/Mksem7jzlgy8U7w=;
        b=uZ3XMOQ4CZBG1jROGxZneTOAF/aHCdQeyVlB3ZvRPBwfRRELY87Zy/FrPPzIzbtjeh
         ZSWzeilRJ+ltWjl6Wf8XjC9YNwgPUsO+ASAyoEpi37Hdt+3QAoXCC++PIZTbJa+8GGpT
         ztxtBduTxsquEyTofbr7TcgqSWVtLd7onuIkpBAvohocO81okO6x/h7Iv1zDYrwdr0Z2
         kJ0J4Pqwssy9Ok05g+TqqC9JqKfzAcE1Dj26Qt1C8YWblqqz3/BxVrgLkk6V9ppyP0Tm
         U1HmZNDGhHKG9qiukpFLS4kOR8UXxsshrJCRpDGH0Gvo4YSruUMZxSH4zyFR1N0DauXC
         3IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8V6HFmLfGm9H0h60UuqXdO7H0Hr/Mksem7jzlgy8U7w=;
        b=DDtA5plIXEPMxaOUAbperu9s53RjYf4bQbM0f5ZRW+C/RwvRN5rjR52dIpikhITeBz
         j98RAsMpqs+qEn8DsBWo0f1E5cYm6Pdu37KFjRS0ZfYauink7Cm84pfMTjNrUNmv29Zl
         8QgzR4JeM1wY6wgbu9vRpOgPDKyasXB/uRZq3ufvpCiP2Q9SFUjIAHAG8jjz2y+L9bjc
         +0FYzQBdcoggFWfhJ308pa1zRAb+sJVicapzgIEO8xzlTlq9MU97tVBGZ/cTDpWm5X8V
         eKIY4Fw3N5v8HIqNWnNL4lYkV5AW9IWXzrtOBxBH3GMyBM+pfJWZtu6TroJHc3bD2SSu
         s1RQ==
X-Gm-Message-State: AOAM5334HOEe3FbhmMlOtR1z7SruLA98auDOkLS/tJq+bWS8vL54Tp2y
        GnYq0i4HMz2EHz6qAHDWz42RXw==
X-Google-Smtp-Source: ABdhPJx/yccrdZJLJQ925LbLp9rVL/mKCFCY/9xVs/BHknKusK+X01L1pvGaa2hA8nHDDt3N08i1SQ==
X-Received: by 2002:a17:90a:c250:: with SMTP id d16mr14494880pjx.60.1592767989562;
        Sun, 21 Jun 2020 12:33:09 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q68sm11641137pjc.30.2020.06.21.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:33:08 -0700 (PDT)
Date:   Sun, 21 Jun 2020 12:30:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v7 4/5] remoteproc: ingenic: Added remoteproc driver
Message-ID: <20200621193022.GA149351@builder.lan>
References: <20200515104340.10473-1-paul@crapouillou.net>
 <20200515104340.10473-4-paul@crapouillou.net>
 <8cdcf5ef-1268-89f6-b229-ac711a80b790@ti.com>
 <FR8SBQ.5WXNHNH8P2P7@crapouillou.net>
 <fc1e14e7-4551-48c3-2820-f5889c50becb@ti.com>
 <G3ATBQ.KJYAFROKKWDP1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <G3ATBQ.KJYAFROKKWDP1@crapouillou.net>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 12 Jun 04:47 PDT 2020, Paul Cercueil wrote:
> Le jeu. 11 juin 2020 =E0 19:21, Suman Anna <s-anna@ti.com> a =E9crit :
> > On 6/11/20 5:21 PM, Paul Cercueil wrote:
> > > Le jeu. 11 juin 2020 =E0 16:47, Suman Anna <s-anna@ti.com> a =E9crit :
> > > > On 5/15/20 5:43 AM, Paul Cercueil wrote:
[..]
> > > > > diff --git a/drivers/remoteproc/ingenic_rproc.c
> > > > > =7F=7F=7Fb/drivers/remoteproc/ingenic_rproc.c
[..]
> > > > > +    /* The clocks must be enabled for the firmware to be
> > > > > loaded in =7F=7F=7FTCSM */
> > > > > +    ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(vpu->clks),
> > > > > vpu->clks);
> > > > > +    if (ret) {
> > > > > +        dev_err(dev, "Unable to start clocks\n");
> > > > > +        return ret;
> > > > > +    }
> > > >=20
> > > > You are enabling the clocks directly here and also trying to
> > > > manage =7F=7Fthem through pm_runtime callbacks again.
> > >=20
> > > Yes. The clocks need to be enabled in the probe.
> >=20
> > For the preferred non CONFIG_PM case now and lack of
> > prepare/unprepare().
>=20
> I want to make it clear that I'm not against having .prepare/.unprepare, =
but
> I want to see what maintainers have to say.
>=20

I think it's perfectly reasonable to enable all the resources here and
then if CONFIG_PM isn't set you just leave them enabled throughout.

Regards,
Bjorn
