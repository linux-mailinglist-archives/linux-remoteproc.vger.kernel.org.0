Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E68DA6AF6B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 16 Jul 2019 20:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfGPS7j (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 16 Jul 2019 14:59:39 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:38146 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfGPS7j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Jul 2019 14:59:39 -0400
Received: by mail-pl1-f171.google.com with SMTP id az7so10578537plb.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2019 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=hBJsfG+kxvEykqFUPJPZgqlmTa9miwWtUSC2L+vLfP0=;
        b=rTafQ1i3JELdrOWJ5WSPdSQQwWR9tojAgsl4geqBK2ZdDVwUPVO5YBRRdmHlAMJj8h
         T3cIKg3ivUvNYeW+SQt5fcjPlhM6xsK84xL1NqIhkBoSy2h6a2RNvC4KTsY5ruB+TJPh
         a6fSWDYUwWmjaJI+265DFaBcq14FLWh3XyX7CzhJ8qsiTs4K2qNpwP9B4/CX+HDSNua2
         t+cuf4OmTC6gFXaAnM/QAwdfKPK8ire8G6YjF3jHdzA9TUSIrU3A/AcXiM9voIVS78Hn
         t81Odf6StdnitZCOEhpJsq24DvZVwpJ99em5+JTs748nSoL1O4trtGWXzdZHhmi8nmkl
         NE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=hBJsfG+kxvEykqFUPJPZgqlmTa9miwWtUSC2L+vLfP0=;
        b=EXsSChJmSg+73VnuqG7DwW0hUDRw1GsQJNchg+k91WzllXrp3WfDD62hrpWujAR3i+
         JS7LUxmPXBgtTzgRVzUihMswTUvasX765DzUHz34kekn+DBpyXu4I5SS/vQjD3ZAuHh5
         5ydg+32sqhJ5lAMQkAgxrngr9hj8tZDCyYk0xohD27AFXfGjArS4KEoCSMeoQ3X7pkaO
         BZYth6+l18BV6gQmeBZSAQSkniuMeR3Dn8LRUrOwbTKiUHXT3gKV9PT9Jf9lf4ZjRF97
         6G5fApk2rQkpnhUSXHTt0F/oO6axP68iK60tgvq1vVboI2nV3rw2pYiAC4VBRbOK+Jgy
         NKeA==
X-Gm-Message-State: APjAAAU3fiAwb/kGnPQHO1UZhNcxsy5pBUqw2iEgNn/IWMgunlbzxMSd
        QlKA/n0MuDhjG6qqgdDOz1VCxg==
X-Google-Smtp-Source: APXvYqxJBz67JnnuTcUz76s83oxJjhlbQ27GD9dFu8zmDsc8MA6X4i+IL4StramzuJafjdqHNn3w2Q==
X-Received: by 2002:a17:902:2862:: with SMTP id e89mr38000072plb.258.1563303578543;
        Tue, 16 Jul 2019 11:59:38 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i124sm42317997pfe.61.2019.07.16.11.59.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 11:59:37 -0700 (PDT)
Date:   Tue, 16 Jul 2019 12:00:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pi-Hsun Shih <pihsun@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [GIT PULL] rpmsg updates for v5.3
Message-ID: <20190716190057.GA8572@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v5.3

for you to fetch changes up to 54119bc1110dab2fa389f45c73a0787b8e037e8b:

  rpmsg: core: Make remove handler for rpmsg driver optional. (2019-05-21 23:54:06 -0700)

----------------------------------------------------------------
rpmsg updates for v5.3

This contains a DT binding update and a change to make the remote
function of rpmsg_devices optional.

----------------------------------------------------------------
Pi-Hsun Shih (1):
      rpmsg: core: Make remove handler for rpmsg driver optional.

Sibi Sankar (1):
      dt-bindings: soc: qcom: Add remote-pid binding for GLINK SMEM

 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
 drivers/rpmsg/rpmsg_core.c                                | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)
