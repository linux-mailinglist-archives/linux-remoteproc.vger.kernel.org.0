Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB83A182614
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Mar 2020 01:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731448AbgCLAAE (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 11 Mar 2020 20:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731423AbgCLAAE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Mar 2020 20:00:04 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583971204;
        bh=/ckLZpQrvikUxo2UyX7CpRCubxmeJ6l4cbt3GO7SxOk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RFEsV+fWHeuXo1vD9FNaFfSTicFc4si+0WoK0sc1HeJdswVGj3LoubKfwjgQDvbwB
         iUIoAqsu+YC1wsbS7u55GlGJrnVy3mMLt2PbtKw36+OvumUQz1+CHsriiDnKCmceRu
         UPsaRVujepsRi4WPfXEHSIXrLh4aMMFgoWO3cQns=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: stm32: demote warning about optional property absence
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158397120404.18219.13294090237976627276.git-patchwork-notify@kernel.org>
Date:   Thu, 12 Mar 2020 00:00:04 +0000
References: <20200224172519.15315-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200224172519.15315-1-a.fatoum@pengutronix.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 24 Feb 2020 18:25:19 +0100 you wrote:
> The mainline device trees lack the "st,syscfg-pdds", so probing the
> driver always throws the warning. As the property is optional per binding
> and the driver can deal with its absence, demote the warning to info log
> level.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> [...]


Here is a summary with links:
  - remoteproc: stm32: demote warning about optional property absence
    https://git.kernel.org/andersson/remoteproc/c/93b2c0b30c355cc33d8946fa0f835b38435d604a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
