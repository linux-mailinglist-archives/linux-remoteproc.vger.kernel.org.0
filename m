Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB1CB166FED
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Feb 2020 08:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgBUHDH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 21 Feb 2020 02:03:07 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45409 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBUHDH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Feb 2020 02:03:07 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j52L2-0003Dw-Ti; Fri, 21 Feb 2020 08:03:04 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j52L1-0002kq-VG; Fri, 21 Feb 2020 08:03:03 +0100
Date:   Fri, 21 Feb 2020 08:03:03 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Message-ID: <20200221070303.kndekskjj6cvwtkb@pengutronix.de>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <20200221065140.mn4wxk5c2xayqwan@pengutronix.de>
 <AM0PR04MB4481C4C811F139665AB1C54088120@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB4481C4C811F139665AB1C54088120@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello,

On Fri, Feb 21, 2020 at 06:56:02AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
> > i can't apply your patches on kernel master HEAD. Do I need some extras?
> 
> The patchset is based on Shawn's for-next branch. With Loic' V4 patch
> applied as showed in cover-letter.

BTW, the generic approach to formalize that is using --base to
git-format-patch (or git-send-email). See
https://people.kernel.org/monsieuricon/all-patches-must-include-base-commit-info

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
